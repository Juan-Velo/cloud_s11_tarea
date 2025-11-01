import boto3
import json

def lambda_handler(event, context):
    # Manejar tanto lambda-proxy como lambda integration
    if isinstance(event.get('body'), str):
        body = json.loads(event.get('body', '{}'))
    else:
        body = event.get('body', event)
    
    nombre_bucket = body.get('bucket_name')
    if not nombre_bucket:
        return {'statusCode': 400, 'body': json.dumps({'error': 'bucket_name requerido'})}
    
    # Proceso    
    s3 = boto3.client('s3')
    try:
        response = s3.list_objects_v2(Bucket=nombre_bucket)
        lista = []
        if 'Contents' in response:
            for obj in response['Contents']:
                lista.append(obj['Key'])
        
        return {
            'statusCode': 200,
            'body': json.dumps({
                'bucket': nombre_bucket,
                'lista_objetos': lista
            })
        }
    except Exception as e:
        return {'statusCode': 500, 'body': json.dumps({'error': str(e)})}
