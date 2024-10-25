#!/usr/bin/env bash 
#
# Este script se encarga de invocar los tres programas que permiten la 
# conversión de PNGs a secuencia de pixeles, procesar esos pixeles y
# posteriormente convertir la secuencia de pixeles a archivos en formato
# PNG.
#
# Ahora procesa todas las imágenes en la carpeta 'imagenes'.
#
# Autor: John Sanabria - john.sanabria@correounivalle.edu.co
# Fecha: 2024-08-22
#

# Carpeta donde están las imágenes PNG
IMAGE_DIR="./imagenes"

# Iterar sobre todos los archivos PNG en la carpeta
for INPUT_PNG in ${IMAGE_DIR}/*.png; do
    TEMP_FILE="${INPUT_PNG%.png}.bin"
    
    # Convertir PNG a formato binario
    python3 fromPNG2Bin.py ${INPUT_PNG}
    
    # Aplicar filtro usando el programa main
    ./main ${TEMP_FILE}
    
    # Convertir el archivo binario procesado de vuelta a PNG
    python3 fromBin2PNG.py ${TEMP_FILE}.new
    
    echo "Procesado: ${INPUT_PNG}"
done
