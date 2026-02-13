#!/usr/bin/env node

/**
 * Node.js Example - Programmatic Usage of Excel Inspector
 * ========================================================
 * 
 * This example shows how to use Excel Inspector as a module
 * in your Node.js applications.
 */

const { execSync } = require('child_process');
const path = require('path');
const fs = require('fs');

// Configuration
const EXCEL_FILE = process.argv[2] || 'sample.xlsx';

console.log('📊 Excel Inspector - Node.js Example');
console.log('=====================================\n');

// Check if file exists
if (!fs.existsSync(EXCEL_FILE)) {
  console.error(`❌ Error: File not found: ${EXCEL_FILE}`);
  console.log('\nUsage: node node-example.js <excel-file.xlsx>');
  process.exit(1);
}

console.log(`📁 Processing file: ${EXCEL_FILE}\n`);

/**
 * Example 1: Get full data
 */
function getFullData() {
  console.log('1️⃣  Getting full data...');
  
  try {
    const output = execSync(`excel-inspector "${EXCEL_FILE}"`, {
      encoding: 'utf-8'
    });
    
    const data = JSON.parse(output);
    
    console.log(`   ✓ Found ${data.metadata.sheetCount} sheet(s)`);
    console.log(`   Sheets: ${data.metadata.sheets.join(', ')}`);
    
    return data;
  } catch (error) {
    console.error(`   ✗ Error: ${error.message}`);
    return null;
  }
}

/**
 * Example 2: Get structure only
 */
function getStructure() {
  console.log('\n2️⃣  Getting structure only...');
  
  try {
    const output = execSync(`excel-inspector "${EXCEL_FILE}" --headers-only`, {
      encoding: 'utf-8'
    });
    
    const data = JSON.parse(output);
    
    Object.keys(data.sheets).forEach(sheetName => {
      const sheet = data.sheets[sheetName];
      console.log(`   📄 ${sheetName}:`);
      console.log(`      Columns (${sheet.headerCount}): ${sheet.headers.join(', ')}`);
      console.log(`      Rows: ${sheet.rowCount}`);
    });
    
    return data;
  } catch (error) {
    console.error(`   ✗ Error: ${error.message}`);
    return null;
  }
}

/**
 * Example 3: Get specific sheet
 */
function getSheet(sheetName) {
  console.log(`\n3️⃣  Getting specific sheet: ${sheetName}...`);
  
  try {
    const output = execSync(`excel-inspector "${EXCEL_FILE}" --sheet "${sheetName}"`, {
      encoding: 'utf-8'
    });
    
    const data = JSON.parse(output);
    const sheet = data.sheets[sheetName];
    
    if (sheet) {
      console.log(`   ✓ Loaded ${sheet.rowCount} rows`);
      console.log(`   Sample data (first row):`, sheet.data[0]);
    } else {
      console.log(`   ✗ Sheet "${sheetName}" not found`);
    }
    
    return sheet;
  } catch (error) {
    console.error(`   ✗ Error: ${error.message}`);
    return null;
  }
}

/**
 * Example 4: Process and filter data
 */
function processData(data) {
  console.log('\n4️⃣  Processing data...');
  
  if (!data) {
    console.log('   ⚠️  No data to process');
    return;
  }
  
  const firstSheet = data.sheets[data.metadata.sheets[0]];
  
  if (!firstSheet || !firstSheet.data || firstSheet.data.length === 0) {
    console.log('   ⚠️  No data in first sheet');
    return;
  }
  
  console.log(`   Processing ${firstSheet.data.length} rows...`);
  
  // Example: Filter rows where first column is not empty
  const firstColumn = firstSheet.headers[0];
  const filtered = firstSheet.data.filter(row => row[firstColumn] != null);
  
  console.log(`   ✓ Filtered: ${filtered.length} rows with non-empty ${firstColumn}`);
  
  // Example: Group by column
  const stats = {};
  firstSheet.headers.forEach(header => {
    const values = firstSheet.data.map(row => row[header]);
    const nonEmpty = values.filter(v => v != null && v !== '');
    
    stats[header] = {
      total: values.length,
      nonEmpty: nonEmpty.length,
      emptyPercent: ((values.length - nonEmpty.length) / values.length * 100).toFixed(1) + '%'
    };
  });
  
  console.log('\n   📊 Column Statistics:');
  Object.keys(stats).forEach(col => {
    console.log(`      ${col}: ${stats[col].nonEmpty}/${stats[col].total} filled (${stats[col].emptyPercent} empty)`);
  });
}

/**
 * Example 5: Save to file
 */
function saveToFile(data, outputFile) {
  console.log(`\n5️⃣  Saving to file: ${outputFile}...`);
  
  try {
    fs.writeFileSync(outputFile, JSON.stringify(data, null, 2));
    console.log(`   ✓ Saved successfully`);
    console.log(`   Size: ${(fs.statSync(outputFile).size / 1024).toFixed(2)} KB`);
  } catch (error) {
    console.error(`   ✗ Error: ${error.message}`);
  }
}

// Run examples
async function main() {
  const fullData = getFullData();
  getStructure();
  
  if (fullData && fullData.metadata.sheets.length > 0) {
    const firstSheetName = fullData.metadata.sheets[0];
    getSheet(firstSheetName);
  }
  
  processData(fullData);
  
  if (fullData) {
    const outputFile = path.join(__dirname, 'output.json');
    saveToFile(fullData, outputFile);
  }
  
  console.log('\n✅ Examples completed!\n');
}

// Execute
main().catch(error => {
  console.error('❌ Fatal error:', error.message);
  process.exit(1);
});
