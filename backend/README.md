# Backend - Cloud Resume Challenge

This directory contains the serverless backend logic for the Cloud Resume Challenge.

## Description
The backend handles the core server-side functionality, specifically the creation and incrementing of a live page-view counter using AWS native services.

## Architecture
- **Language**: Python 3.12 
- **Dependencies**: AWS Native Python SDK (`boto3`)
- **Compute**: AWS Lambda
- **Database**: Amazon DynamoDB

## Files
- `lambda_function.py`: The single serverless function. It connects to the DynamoDB table, strictly performs an atomic `ADD visits :inc` operation, fetches the updated count, and returns a JSON payload including permissive CORS headers.

## Testing locally
Since this function is designed to run in AWS Lambda, testing it locally requires injecting standard Lambda `event` and `context` objects and configuring dummy AWS credentials. Alternatively, deploy it using the Terraform configuration at the root of the project to test inside AWS.