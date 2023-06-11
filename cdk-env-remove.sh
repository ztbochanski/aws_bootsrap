#!/bin/bash

aws cloudformation list-stacks --query "StackSummaries[?StackName=='CDKToolkit'&&StackStatus=='CREATE_COMPLETE']"
aws cloudformation delete-stack --stack-name CDKToolkit
cdkbucket=$(aws s3 ls | grep cdk- | awk '{printf $3}')
echo $cdkbucket
aws s3api delete-objects --bucket $cdkbucket \
  --delete "$(aws s3api list-object-versions \
  --bucket $cdkbucket \
  --output=json \
  --query='{Objects: Versions[].{Key:Key,VersionId:VersionId}}')"
aws s3api delete-bucket --bucket $cdkbucket
