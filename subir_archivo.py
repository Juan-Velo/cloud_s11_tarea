import boto3
import json
import base64

def lambda_handler(event, context):
    # Manejar tanto lambda-proxy como lambda integration
    if isinstance(event.get('body'), str):
        body = json.loads(event.get('body', '{}'))
    else:
        body = event.get('body', event)
    
    bucket_name = body.get('bucket_name')
    directorio = body.get('directorio')
    filename = body.get('filename')
    file_content = body.get('file_content')  # Debe ser base64
    if not bucket_name or not directorio or not filename or not file_content:
        return {'statusCode': 400, 'body': json.dumps({'error': 'bucket_name, directorio, filename y file_content requeridos'})}
    
    s3 = boto3.client('s3')
    try:
        decoded_file = base64.b64decode(file_content)
        s3.put_object(Bucket=bucket_name, Key=f'{directorio}/{filename}', Body=decoded_file)
        return {'statusCode': 200, 'body': json.dumps({'message': f'Archivo {filename} subido a {directorio} en {bucket_name}'})}
    except Exception as e:
        return {'statusCode': 500, 'body': json.dumps({'error': str(e)})}
