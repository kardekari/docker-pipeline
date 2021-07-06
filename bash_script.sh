#!/bin/bash

echo "hi from bash script"


echo $SSH_KEY

echo $SSH_KEY >> sshfile.pem

chmod 600 sshfile.pem

cat sshfile.pem

ssh -o StrictHostKeyChecking=no -i sshfile.pem ubuntu@3.108.165.10

ls -l

exit


