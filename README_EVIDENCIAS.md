# Evidencias - API REST S3 con AWS Lambda

## 📋 Información del Proyecto

**Curso:** Cloud Computing  
**Semana:** 11  
**Tema:** API REST para gestión de S3 con AWS Lambda y Serverless Framework  
**Fecha:** 01 de Noviembre 2025

---

## 🎯 Objetivos Completados

✅ Modificar serverless.yml con 3 funciones:
- Crear un nuevo bucket
- Crear un directorio en un bucket existente
- Subir un archivo en un directorio de un bucket existente

✅ Desplegar en los stages: dev, test y prod

✅ Probar el API REST desde Linux con curl

✅ Probar el API REST con Postman

---

## 🚀 Despliegues Realizados

### Stage: DEV
```
✔ Service deployed to stack api-s3-dev (43s)

endpoints:
  GET - https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/lista-buckets
  POST - https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/lista-objetos
  POST - https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear
  POST - https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear-directorio
  POST - https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/subir-archivo

functions:
  lista_buckets: api-s3-dev-lista_buckets (2.7 kB)
  lista_objetos_bucket: api-s3-dev-lista_objetos_bucket (2.7 kB)
  crear_bucket: api-s3-dev-crear_bucket (2.7 kB)
  crear_directorio: api-s3-dev-crear_directorio (2.7 kB)
  subir_archivo: api-s3-dev-subir_archivo (2.7 kB)
```

### Stage: TEST
```
✔ Service deployed to stack api-s3-test (43s)

endpoints:
  GET - https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/lista-buckets
  POST - https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/bucket/lista-objetos
  POST - https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/bucket/crear
  POST - https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/bucket/crear-directorio
  POST - https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test/s3/bucket/subir-archivo

functions:
  lista_buckets: api-s3-test-lista_buckets (2.7 kB)
  lista_objetos_bucket: api-s3-test-lista_objetos_bucket (2.7 kB)
  crear_bucket: api-s3-test-crear_bucket (2.7 kB)
  crear_directorio: api-s3-test-crear_directorio (2.7 kB)
  subir_archivo: api-s3-test-subir_archivo (2.7 kB)
```

### Stage: PROD
```
✔ Service deployed to stack api-s3-prod (43s)

endpoints:
  GET - https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/lista-buckets
  POST - https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/bucket/lista-objetos
  POST - https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/bucket/crear
  POST - https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/bucket/crear-directorio
  POST - https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod/s3/bucket/subir-archivo

functions:
  lista_buckets: api-s3-prod-lista_buckets (2.7 kB)
  lista_objetos_bucket: api-s3-prod-lista_objetos_bucket (2.7 kB)
  crear_bucket: api-s3-prod-crear_bucket (2.7 kB)
  crear_directorio: api-s3-prod-crear_directorio (2.7 kB)
  subir_archivo: api-s3-prod-subir_archivo (2.7 kB)
```

---

## 🔧 Configuración serverless.yml

```yaml
org: juanvelo
service: api-s3

provider:
  name: aws
  runtime: python3.13
  memorySize: 256
  timeout: 20
  iam:
    role: arn:aws:iam::902206004539:role/LabRole

functions:
  lista_buckets:
    handler: lista_buckets.lambda_handler
    memorySize: 512
    events:
      - http:
          path: /s3/lista-buckets
          method: get
          cors: true
          integration: lambda

  lista_objetos_bucket:
    handler: lista_objetos_bucket.lambda_handler
    events:
      - http:
          path: /s3/bucket/lista-objetos
          method: post
          cors: true
          integration: lambda

  crear_bucket:
    handler: crear_bucket.lambda_handler
    events:
      - http:
          path: /s3/bucket/crear
          method: post
          cors: true
          integration: lambda

  crear_directorio:
    handler: crear_directorio.lambda_handler
    events:
      - http:
          path: /s3/bucket/crear-directorio
          method: post
          cors: true
          integration: lambda

  subir_archivo:
    handler: subir_archivo.lambda_handler
    events:
      - http:
          path: /s3/bucket/subir-archivo
          method: post
          cors: true
          integration: lambda
```

---

## 💻 Pruebas con CURL (Linux)

### 1. Crear Bucket (DEV)
```bash
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-dev-20251101"}'
```

**Respuesta esperada:**
```json
{"message": "Bucket mi-bucket-dev-20251101 creado exitosamente"}
```

### 2. Crear Directorio
```bash
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear-directorio \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-dev-20251101","directorio":"documentos"}'
```

**Respuesta esperada:**
```json
{"message": "Directorio documentos creado en mi-bucket-dev-20251101"}
```

### 3. Subir Archivo
```bash
# Codificar contenido en base64
FILE_CONTENT=$(echo "Hola Mundo desde Lambda y S3!" | base64)

curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/subir-archivo \
  -H "Content-Type: application/json" \
  -d "{\"bucket_name\":\"mi-bucket-dev-20251101\",\"directorio\":\"documentos\",\"filename\":\"test.txt\",\"file_content\":\"$FILE_CONTENT\"}"
```

**Respuesta esperada:**
```json
{"message": "Archivo test.txt subido a documentos en mi-bucket-dev-20251101"}
```

### 4. Listar Objetos
```bash
curl -X POST https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/lista-objetos \
  -H "Content-Type: application/json" \
  -d '{"bucket_name":"mi-bucket-dev-20251101"}'
```

### 5. Listar Buckets
```bash
curl -X GET https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/lista-buckets
```

---

## 📱 Pruebas con Postman

### Instrucciones:
1. Importar el archivo `postman_collection.json` en Postman
2. La colección contiene carpetas para cada stage (DEV, TEST, PROD)
3. Ejecutar las peticiones en orden:
   - Crear Bucket
   - Crear Directorio
   - Subir Archivo
   - Listar Objetos
   - Listar Buckets

### Screenshots a capturar:
- ✅ Crear Bucket en DEV
- ✅ Crear Directorio en DEV
- ✅ Subir Archivo en DEV
- ✅ Listar Objetos del Bucket
- ✅ Listar todos los Buckets

---

## 📊 Evidencias en AWS Console

### Screenshots requeridos:

#### 1. AWS Lambda Console
- Lista de funciones Lambda desplegadas (dev, test, prod)
- Detalles de una función (código, configuración, triggers)

#### 2. API Gateway Console
- APIs creadas para cada stage
- Endpoints configurados
- Métodos HTTP (GET, POST)

#### 3. AWS S3 Console
- Lista de buckets creados:
  - mi-bucket-dev-20251101
  - mi-bucket-test-20251101
  - mi-bucket-prod-20251101
- Estructura de directorios dentro de cada bucket
- Archivos subidos en los directorios
- Detalles de un archivo (propiedades, metadata)

#### 4. CloudWatch Logs
- Logs de ejecución de las funciones Lambda
- Logs exitosos y/o errores

---

## 📁 Archivos del Proyecto

```
api-s3/
├── crear_bucket.py           # Lambda: Crear bucket
├── crear_directorio.py       # Lambda: Crear directorio
├── subir_archivo.py          # Lambda: Subir archivo
├── lista_buckets.py          # Lambda: Listar buckets
├── lista_objetos_bucket.py   # Lambda: Listar objetos
├── serverless.yml            # Configuración Serverless Framework
├── comandos_curl.sh          # Script con comandos curl
├── postman_collection.json   # Colección Postman
└── README_EVIDENCIAS.md      # Este archivo
```

---

## 🎓 Conclusiones

1. **Serverless Framework** facilita el despliegue de funciones Lambda y API Gateway
2. Las funciones Lambda permiten gestionar S3 de forma serverless
3. Los stages (dev, test, prod) permiten separar ambientes
4. La API REST es fácil de probar con curl o Postman
5. S3 se integra perfectamente con Lambda para operaciones CRUD

---

## 📝 Notas Adicionales

- **Region:** us-east-1
- **Runtime:** Python 3.13
- **IAM Role:** LabRole
- **Memory Size:** 256 MB (512 MB para lista_buckets)
- **Timeout:** 20 segundos

---

## 🔗 Enlaces de Referencia

- [Serverless Framework Documentation](https://www.serverless.com/framework/docs)
- [AWS Lambda Python](https://docs.aws.amazon.com/lambda/latest/dg/lambda-python.html)
- [AWS S3 boto3](https://boto3.amazonaws.com/v1/documentation/api/latest/reference/services/s3.html)

---

**Autor:** Juan Velo  
**Organización:** juanvelo  
**Repositorio:** https://github.com/Juan-Velo/cloud_s11_tarea
