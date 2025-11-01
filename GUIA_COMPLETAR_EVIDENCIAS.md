# 🚀 GUÍA RÁPIDA - Completar Evidencias

## ✅ Lo que ya está hecho:

1. ✅ serverless.yml configurado con 3 funciones
2. ✅ Funciones Python implementadas
3. ✅ Despliegue exitoso en DEV, TEST y PROD
4. ✅ Archivos de ayuda creados:
   - comandos_curl.sh
   - postman_collection.json
   - evidencias.html
   - README_EVIDENCIAS.md

---

## 📋 PASOS A SEGUIR:

### 1️⃣ Ejecutar pruebas en Linux con curl

En tu terminal de Ubuntu, ejecuta:

```bash
cd ~/cloud_s11_tarea
chmod +x comandos_curl.sh
./comandos_curl.sh
```

**Tomar screenshots de:**
- ✅ Cada comando curl ejecutado
- ✅ Las respuestas JSON de cada endpoint
- ✅ Comando para crear bucket
- ✅ Comando para crear directorio
- ✅ Comando para subir archivo
- ✅ Comando para listar objetos
- ✅ Comando para listar buckets

### 2️⃣ Pruebas con Postman

1. Abre Postman
2. Import → File → Selecciona `postman_collection.json`
3. Ejecuta cada petición en orden:
   - DEV/1. Listar Buckets
   - DEV/2. Crear Bucket
   - DEV/3. Crear Directorio
   - DEV/4. Subir Archivo
   - DEV/5. Listar Objetos del Bucket
   - Repetir con TEST y PROD

**Tomar screenshots de:**
- ✅ Colección importada en Postman
- ✅ Cada request ejecutado (mostrando body y response)
- ✅ Status 200 OK en las respuestas exitosas

### 3️⃣ Screenshots en AWS Console

#### A. AWS Lambda Console
1. Ve a https://console.aws.amazon.com/lambda
2. Región: us-east-1

**Tomar screenshots de:**
- ✅ Lista de funciones Lambda (filtrar por "api-s3")
- ✅ Detalle de función `api-s3-dev-crear_bucket`
- ✅ Detalle de función `api-s3-dev-crear_directorio`
- ✅ Detalle de función `api-s3-dev-subir_archivo`
- ✅ Código de una función
- ✅ Configuración (memory, timeout)

#### B. API Gateway Console
1. Ve a https://console.aws.amazon.com/apigateway
2. Busca las APIs: api-s3-dev, api-s3-test, api-s3-prod

**Tomar screenshots de:**
- ✅ Lista de APIs creadas
- ✅ Recursos y métodos del stage DEV
- ✅ Vista de Stages
- ✅ Configuración de un endpoint POST

#### C. Amazon S3 Console
1. Ve a https://s3.console.aws.amazon.com/s3/buckets
2. Busca los buckets creados

**Tomar screenshots de:**
- ✅ Lista de buckets (mi-bucket-dev-20251101, test, prod)
- ✅ Interior del bucket DEV mostrando directorio "documentos/"
- ✅ Interior del directorio "documentos" mostrando el archivo test.txt
- ✅ Propiedades del archivo test.txt
- ✅ Bucket TEST con directorio "imagenes/"
- ✅ Bucket PROD con directorio "videos/"

#### D. CloudWatch Logs
1. Ve a https://console.aws.amazon.com/cloudwatch/home?region=us-east-1#logsV2:log-groups
2. Busca los log groups: /aws/lambda/api-s3-dev-*

**Tomar screenshots de:**
- ✅ Lista de Log Groups
- ✅ Log streams de una función
- ✅ Logs de ejecución exitosa

#### E. CloudFormation
1. Ve a https://console.aws.amazon.com/cloudformation
2. Busca los stacks: api-s3-dev, api-s3-test, api-s3-prod

**Tomar screenshots de:**
- ✅ Lista de stacks creados por Serverless Framework
- ✅ Resources de un stack
- ✅ Outputs de un stack

### 4️⃣ Crear documento final

1. Abre el archivo `evidencias.html` en tu navegador
2. Opción A: **Word**
   - Copia todo el contenido del HTML
   - Pega en Word
   - Inserta los screenshots en los placeholders
   - Ajusta formato si es necesario

3. Opción B: **PowerPoint**
   - Crea slides por sección
   - Inserta screenshots
   - Agrega los comandos curl y respuestas

4. Opción C: **HTML mejorado**
   - Inserta las imágenes en el HTML usando <img> tags
   - Convierte a PDF con el navegador (Ctrl+P → Guardar como PDF)

---

## 🎯 URLs de los Endpoints (para copiar/pegar)

### DEV
- GET: https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/lista-buckets
- POST: https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear
- POST: https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/crear-directorio
- POST: https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/subir-archivo
- POST: https://9bfm4zr7zi.execute-api.us-east-1.amazonaws.com/dev/s3/bucket/lista-objetos

### TEST
- Base URL: https://t4ccvldmhi.execute-api.us-east-1.amazonaws.com/test

### PROD
- Base URL: https://sxzvnx8o0a.execute-api.us-east-1.amazonaws.com/prod

---

## 📦 Nombres de buckets a crear:

- mi-bucket-dev-20251101
- mi-bucket-test-20251101
- mi-bucket-prod-20251101

---

## 💡 Tips:

1. **Usa Snipping Tool o Screenshot Tool** para capturar pantallas
2. **Organiza los screenshots** en carpetas (linux, postman, aws-lambda, api-gateway, s3, etc.)
3. **Nomenclatura sugerida:** 01-crear-bucket.png, 02-crear-directorio.png, etc.
4. **En Postman:** Asegúrate de mostrar el Body y la Response
5. **En AWS Console:** Usa nombres descriptivos que se vean en las capturas

---

## ✅ Checklist Final:

- [ ] Ejecuté todos los comandos curl en Linux
- [ ] Capturé screenshots de cada comando curl
- [ ] Importé colección en Postman
- [ ] Ejecuté todas las peticiones en Postman
- [ ] Capturé screenshots de Postman
- [ ] Capturé screenshots de AWS Lambda
- [ ] Capturé screenshots de API Gateway
- [ ] Capturé screenshots de S3 (buckets, directorios, archivos)
- [ ] Capturé screenshots de CloudWatch Logs
- [ ] Capturé screenshots de CloudFormation
- [ ] Inserté todos los screenshots en el documento
- [ ] Revisé que el documento se vea bien
- [ ] Guardé el documento en formato Word/PowerPoint/PDF

---

¡Éxito! 🎉
