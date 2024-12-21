
import boto3
import json

def lambda_handler(event, context):
    print("Event received : ", json.dumps(event))


    for record in event['Records']:
        bucket = record['s3']['bucket']['name']
        key = record['s3']['object']['key']
        print(f"New object in Bucket : {bucket}, key {key}")

    return{
            'statusCode': 200,
            'body': json.dumps('S3 Event Processed Successfully ')
    }

