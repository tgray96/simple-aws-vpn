#!/bin/bash

set -eu pipefail

. "scripts/stack_name_vars.sh"

forge deploy \
    --stack-name $STACK_NAME \
    --template-file cloudformation/vpn.yaml \
    --parameters-file params/params.yaml

ADDRESS=$(aws cloudformation describe-stacks --query "Stacks[?StackName=='$STACK_NAME'].Outputs[0].OutputValue" --output text)

echo
echo "Please give the server ~5 minutes to fully configure"
echo "Ensure you send all traffic to the VPN to aid anonymity"
echo "For max security use HTTPS DNS 1.1.1.1 in your settings"
echo

echo "--------------------"
echo "Address: $ADDRESS"
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "Passphrase: $PHRASE"
echo "--------------------"
