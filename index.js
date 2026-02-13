#!/usr/bin/env node

/**
 * Excel Inspector Tool - AI-First
 * 
 * Convierte archivos Excel (.xlsx, .xlsm) a JSON completo para consumo de IAs.
 * Lee el README.md de esta carpeta para instrucciones de uso por IAs.
 * 
 * Uso: node index.js <archivo.xlsx> [opciones]
 * 
 * Opciones:
 *   --sheet "NombreHoja"  Solo procesa una hoja específica
 *   --headers-only        Solo retorna headers de cada hoja (sin datos)
 *   --limit N             Limita a N filas por hoja
 *   --help                Muestra ayuda
 */

const XLSX = require('xlsx');
const path = require('path');
const fs = require('fs');

// Parsear argumentos
const args = process.argv.slice(2);

if (args.length === 0 || args.includes('--help')) {
  console.log(`
Excel Inspector Tool - AI-First
================================

Convierte archivos Excel a JSON completo para consumo de IAs.

USO:
  node index.js <archivo.xlsx> [opciones]

OPCIONES:
  --sheet "NombreHoja"   Solo procesa una hoja específica
  --headers-only         Solo retorna estructura (headers, sin datos)
  --limit N              Limita a N filas por hoja (útil para preview)
  --raw                  Output JSON sin formatear (una línea)
  --help                 Muestra esta ayuda

EJEMPLOS:
  node index.js planilla.xlsx
  node index.js planilla.xlsx --sheet "Stock Rollos"
  node index.js planilla.xlsx --headers-only
  node index.js planilla.xlsx --limit 10

OUTPUT:
  JSON a stdout con estructura:
  {
    "metadata": { ... },
    "sheets": {
      "NombreHoja": {
        "headers": [...],
        "rowCount": N,
        "data": [...]
      }
    }
  }
`);
  process.exit(0);
}

// Obtener archivo
const filePath = args.find(arg => !arg.startsWith('--'));

if (!filePath) {
  console.error('Error: Debe especificar un archivo Excel');
  process.exit(1);
}

// Resolver ruta absoluta
const absolutePath = path.isAbsolute(filePath) 
  ? filePath 
  : path.resolve(process.cwd(), filePath);

if (!fs.existsSync(absolutePath)) {
  console.error(`Error: Archivo no encontrado: ${absolutePath}`);
  process.exit(1);
}

// Parsear opciones
const sheetIndex = args.indexOf('--sheet');
const targetSheet = sheetIndex !== -1 ? args[sheetIndex + 1] : null;

const headersOnly = args.includes('--headers-only');

const limitIndex = args.indexOf('--limit');
const rowLimit = limitIndex !== -1 ? parseInt(args[limitIndex + 1], 10) : null;

const rawOutput = args.includes('--raw');

// Leer Excel
let workbook;
try {
  workbook = XLSX.readFile(absolutePath, {
    cellStyles: false,
    cellNF: false,
    cellDates: true
  });
} catch (error) {
  console.error(`Error al leer archivo: ${error.message}`);
  process.exit(1);
}

// Construir output
const output = {
  metadata: {
    filename: path.basename(absolutePath),
    filepath: absolutePath,
    sheets: workbook.SheetNames,
    sheetCount: workbook.SheetNames.length,
    generatedAt: new Date().toISOString(),
    options: {
      targetSheet,
      headersOnly,
      rowLimit
    }
  },
  sheets: {}
};

// Procesar hojas
const sheetsToProcess = targetSheet 
  ? [targetSheet].filter(s => workbook.SheetNames.includes(s))
  : workbook.SheetNames;

if (targetSheet && !workbook.SheetNames.includes(targetSheet)) {
  console.error(`Error: Hoja "${targetSheet}" no encontrada. Hojas disponibles: ${workbook.SheetNames.join(', ')}`);
  process.exit(1);
}

for (const sheetName of sheetsToProcess) {
  const worksheet = workbook.Sheets[sheetName];
  
  // Convertir a JSON
  let data = XLSX.utils.sheet_to_json(worksheet, {
    header: 1,  // Array de arrays primero para obtener headers
    defval: null,
    blankrows: false
  });
  
  if (data.length === 0) {
    output.sheets[sheetName] = {
      headers: [],
      rowCount: 0,
      isEmpty: true,
      data: []
    };
    continue;
  }
  
  // Extraer headers (primera fila)
  const headers = data[0].map((h, i) => h || `Column_${i + 1}`);
  
  // Datos sin header
  let rows = data.slice(1);
  
  // Aplicar límite si existe
  if (rowLimit && rows.length > rowLimit) {
    rows = rows.slice(0, rowLimit);
  }
  
  // Convertir a objetos con headers como keys
  const dataAsObjects = headersOnly ? [] : rows.map(row => {
    const obj = {};
    headers.forEach((header, index) => {
      obj[header] = row[index] !== undefined ? row[index] : null;
    });
    return obj;
  });
  
  // Calcular estadísticas de columnas
  const columnStats = {};
  if (!headersOnly) {
    headers.forEach((header, colIndex) => {
      const values = rows.map(row => row[colIndex]).filter(v => v !== null && v !== undefined && v !== '');
      const types = [...new Set(values.map(v => typeof v))];
      columnStats[header] = {
        nonEmptyCount: values.length,
        emptyCount: rows.length - values.length,
        types: types,
        sampleValues: values.slice(0, 3)
      };
    });
  }
  
  output.sheets[sheetName] = {
    headers,
    headerCount: headers.length,
    rowCount: data.length - 1,  // Sin header
    rowCountReturned: headersOnly ? 0 : dataAsObjects.length,
    isEmpty: false,
    columnStats: headersOnly ? undefined : columnStats,
    data: dataAsObjects
  };
}

// Output
const jsonOutput = rawOutput 
  ? JSON.stringify(output)
  : JSON.stringify(output, null, 2);

console.log(jsonOutput);
