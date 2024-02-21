#!/bin/bash

export pass=$(cat private_key.pem <(printf "\n") | openssl dgst -sha256)
openssl enc -d -aes-256-cbc -salt -in terraform.tfstate.enc -out terraform.tfstate -pass env:pass -pbkdf2