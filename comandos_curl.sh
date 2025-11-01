#!/bin/bash
# Comandos curl para probar el API REST de S3
# Stage: DEV

echo "=========================================="
echo "STAGE: DEV"
echo "=========================================="

# 1. Listar todos los buckets
echo -e "\n1. LISTAR BUCKETS"
curl -X GET https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/lista-buckets

# 2. Crear un nuevo bucket
echo -e "\n\n2. CREAR BUCKET (mi-bucket-dev-20251101)"
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-dev-20251101"}'

# 3. Crear un directorio en el bucket
echo -e "\n\n3. CREAR DIRECTORIO (documentos)"
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear-directorio \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-dev-20251101","directorio":"documentos"}'

# 4. Subir un archivo (archivo de texto codificado en base64)
echo -e "\n\n4. SUBIR ARCHIVO (test.txt)"
# Crear contenido base64 de "Hola Mundo desde Lambda y S3!"
FILE_CONTENT=$(echo "Hola Mundo desde Lambda y S3!" | base64)
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/subir-archivo \
  -H "Content-Type: application/json" \
  -d "{\"bucket_name\":\"mi-bucket-dev-20251101\",\"directorio\":\"documentos\",\"filename\":\"test.txt\",\"file_content\":\"$FILE_CONTENT\"}"

# 5. Listar objetos del bucket
echo -e "\n\n5. LISTAR OBJETOS DEL BUCKET"
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/lista-objetos \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-dev-20251101"}'

echo -e "\n\n=========================================="
echo "STAGE: TEST"
echo "=========================================="

# TEST Stage
echo -e "\n1. CREAR BUCKET TEST (mi-bucket-test-20251101)"
curl -X POST https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/bucket/crear \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-test-20251101"}'

echo -e "\n\n2. CREAR DIRECTORIO TEST (imagenes)"
curl -X POST https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/bucket/crear-directorio \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-test-20251101","directorio":"imagenes"}'

echo -e "\n\n=========================================="
echo "STAGE: PROD"
echo "=========================================="

# PROD Stage
echo -e "\n1. CREAR BUCKET PROD (mi-bucket-prod-20251101)"
curl -X POST https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/bucket/crear \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-prod-20251101"}'

echo -e "\n\n2. CREAR DIRECTORIO PROD (videos)"
curl -X POST https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/bucket/crear-directorio \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-prod-20251101","directorio":"videos"}'

echo -e "\n\n=========================================="
echo "PRUEBAS COMPLETADAS"
echo "=========================================="
