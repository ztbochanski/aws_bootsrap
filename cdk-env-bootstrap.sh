#!/bin/bash

AWS_ACCOUNT_ID=$(aws sts get-caller-identity --query Account --output text)
echo $AWS_ACCOUNT_ID 
echo $AWS_REGION
echo aws://$AWS_ACCOUNT_ID/$AWS_REGION
cdk bootstrap aws://$AWS_ACCOUNT_ID/$AWS_REGION