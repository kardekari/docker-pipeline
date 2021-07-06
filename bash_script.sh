#!/bin/bash

echo "hi from bash script"


echo $SSH_KEY

echo $SSH_KEY >> sshfile

chmod 600 sshfile

ssh -o StrictHostKeyChecking=no -i sshfile ubuntu@3.108.165.10

ls -l

exit


