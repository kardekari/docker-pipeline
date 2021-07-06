#!/bin/bash

echo "hi from bash script"

# ssh -o StrictHostKeyChecking=no -i ${SSH_KEY} ubuntu@3.108.165.10

# ls -l

echo $SSH_KEY

echo $SSH_KEY >> sshfile

cat  sshfile


