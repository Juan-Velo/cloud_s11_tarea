import boto3
import json

def lambda_handler(event, context):
    body = json.loads(event.get('body', '{}'))
    bucket_name = body.get('bucket_name')
    directorio = body.get('directorio')
    if not bucket_name or not directorio:
        return {'statusCode': 400, 'body': json.dumps({'error': 'bucket_name y directorio requeridos'})}
    s3 = boto3.client('s3')
    try:
        s3.put_object(Bucket=bucket_name, Key=f'{directorio}/')
        return {'statusCode': 200, 'body': json.dumps({'message': f'Directorio {directorio} creado en {bucket_name}'})}
    except Exception as e:
        return {'statusCode': 500, 'body': json.dumps({'error': str(e)})}
