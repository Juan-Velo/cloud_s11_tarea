import boto3
import json

def lambda_handler(event, context):
    # Manejar tanto lambda-proxy como lambda integration
    if isinstance(event.get('body'), str):
        body = json.loads(event.get('body', '{}'))
    else:
        body = event.get('body', event)
    
    bucket_name = body.get('bucket_name')
    if not bucket_name:
        return {'statusCode': 400, 'body': json.dumps({'error': 'bucket_name requerido'})}
    
    s3 = boto3.client('s3')
    try:
        s3.create_bucket(Bucket=bucket_name)
        return {'statusCode': 200, 'body': json.dumps({'message': f'Bucket {bucket_name} creado exitosamente'})}
    except Exception as e:
        return {'statusCode': 500, 'body': json.dumps({'error': str(e)})}
