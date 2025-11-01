# Script para hacer commit y push de los cambios corregidos

Write-Host "🔧 Committing correcciones de funciones Lambda..." -ForegroundColor Cyan

cd "c:\Users\pomaj\Downloads\UTEC_2025_2\Cloud_Computing\Tareas\SEM11\api-s3"

# Verificar estado de git
git status

# Agregar archivos modificados
git add crear_bucket.py
git add crear_directorio.py
git add subir_archivo.py
git add lista_objetos_bucket.py

# Hacer commit
git commit -m "Fix: Corregir manejo de event body en funciones Lambda para integration lambda"

# Push a GitHub
git push origin main

Write-Host "✅ Cambios enviados a GitHub" -ForegroundColor Green
Write-Host ""
Write-Host "📝 Ahora en Linux ejecuta:" -ForegroundColor Yellow
Write-Host "   git pull origin main" -ForegroundColor White
Write-Host "   serverless deploy --stage dev" -ForegroundColor White
Write-Host "   serverless deploy --stage test" -ForegroundColor White
Write-Host "   serverless deploy --stage prod" -ForegroundColor White
