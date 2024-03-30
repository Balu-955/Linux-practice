#!/bin/bash

echo "print list s3 buckets"
aws s3 ls
echo " print list ec2 instances"
aws ec2 describe-instances
echo "print iam function"
aws IAM list-users
