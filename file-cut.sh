#!/bin/bash 
#Script para cortar ficheros fastq - alumno01 (10%) 
#Procesa un fichero pasado como argumento
INPUT_FILE=$1
# Calcular número total de líneas
TOTAL_LINES=$(wc -l < "$INPUT_FILE")
# Calcular el 10% (décima parte)
CUT_LINES=$((TOTAL_LINES / 10))
# Nombre del fichero de salida temporal
OUTPUT_FILE="${INPUT_FILE}.cut"
# Cortar las primeras líneas (10%)
head -n "$CUT_LINES" "$INPUT_FILE" > "$OUTPUT_FILE"
echo "Procesado $INPUT_FILE: $TOTAL_LINES lineas -> $CUT_LINES lineas (10%)"
