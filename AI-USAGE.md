# 📊 Excel Inspector Tool - AI-First

> Herramienta para convertir archivos Excel a JSON consumible por IAs.

---

## 🤖 INSTRUCCIONES PARA IAs

**Si eres una IA y el usuario te pide leer/inspeccionar un archivo Excel, sigue este protocolo:**

### Paso 1: Instalar Dependencias (si no están)
```bash
cd tools/excelInspector && npm install
```

### Paso 2: Ejecutar Inspector
```bash
node tools/excelInspector/index.js "<ruta-al-archivo.xlsx>"
```

### Paso 3: Interpretar Output y Responder al Usuario

El output es JSON con esta estructura:
```json
{
  "metadata": {
    "filename": "archivo.xlsx",
    "sheets": ["Hoja1", "Hoja2"],
    "sheetCount": 2,
    "generatedAt": "2026-01-23T..."
  },
  "sheets": {
    "NombreHoja": {
      "headers": ["Col1", "Col2", ...],
      "rowCount": 150,
      "columnStats": {
        "Col1": { "nonEmptyCount": 140, "types": ["string"], "sampleValues": [...] }
      },
      "data": [{ "Col1": "valor", ... }, ...]
    }
  }
}
```

### Paso 4: Presentar Resultados al Usuario

**SIEMPRE presenta primero un RESUMEN estructurado:**

```markdown
## 📊 Resumen del Excel: [filename]

| Hoja | Filas | Columnas | Descripción |
|------|-------|----------|-------------|
| [nombre] | [rowCount] | [headerCount] | [inferir del contenido] |

### Hojas Encontradas:
1. **[NombreHoja1]** - [X filas, Y columnas]
   - Columnas: `col1`, `col2`, `col3`...
2. **[NombreHoja2]** - [X filas, Y columnas]
   - Columnas: ...
```

### Paso 5: Ofrecer Opciones al Usuario

**SIEMPRE ofrece estas opciones después del resumen:**

```markdown
---

## ¿Qué querés hacer?

1. **Ver datos de una hoja específica** → Indicame cuál
2. **Buscar información específica** → Decime qué buscás
3. **Analizar estructura para migrar a BD** → Propongo esquema
4. **Exportar hoja a formato específico** → CSV, JSON limpio, etc.
5. **Ver muestra de datos** → Primeras N filas de una hoja
```

---

## 🔧 Uso Manual (CLI)

### Instalación
```bash
cd tools/excelInspector
npm install
```

### Comandos

**Inspeccionar archivo completo:**
```bash
node index.js "../archivo.xlsx"
```

**Solo una hoja:**
```bash
node index.js "../archivo.xlsx" --sheet "Stock Rollos"
```

**Solo estructura (sin datos):**
```bash
node index.js "../archivo.xlsx" --headers-only
```

**Limitar filas (preview):**
```bash
node index.js "../archivo.xlsx" --limit 10
```

**Output compacto (una línea):**
```bash
node index.js "../archivo.xlsx" --raw
```

---

## 📋 Opciones Disponibles

| Opción | Descripción |
|--------|-------------|
| `--sheet "Nombre"` | Procesa solo la hoja especificada |
| `--headers-only` | Solo retorna headers, sin datos (útil para archivos grandes) |
| `--limit N` | Limita a N filas por hoja |
| `--raw` | Output JSON en una línea |
| `--help` | Muestra ayuda |

---

## 🎯 Casos de Uso Típicos

### 1. Usuario quiere entender qué tiene el Excel
```bash
node index.js archivo.xlsx --headers-only
```
→ IA presenta resumen de hojas y columnas

### 2. Usuario quiere ver datos de una hoja
```bash
node index.js archivo.xlsx --sheet "MiHoja" --limit 20
```
→ IA presenta tabla con primeras 20 filas

### 3. Usuario quiere migrar a base de datos
```bash
node index.js archivo.xlsx
```
→ IA analiza estructura y propone modelos/migraciones

### 4. Usuario busca dato específico
→ IA carga JSON completo y filtra programáticamente

---

## ⚠️ Notas para IAs

1. **Archivos grandes**: Usar `--headers-only` primero, luego `--sheet` + `--limit`
2. **Errores de encoding**: El Excel puede tener caracteres especiales, manejar con cuidado
3. **Hojas vacías**: Se marcan con `isEmpty: true`
4. **Tipos de datos**: `columnStats.types` indica tipos detectados (string, number, etc.)
5. **Valores nulos**: Se representan como `null` en el JSON

---

## 📁 Archivos

```
tools/excelInspector/
├── index.js      # CLI principal
├── package.json  # Dependencias
└── README.md     # Este archivo (instrucciones para IAs)
```
