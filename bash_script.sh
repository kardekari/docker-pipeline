#!/bin/bash

echo "hi from bash script"


echo $SSH_KEY

# echo $SSH_KEY >> sshfile

# chmod 600 sshfile

# cat sshfile


ssh -o StrictHostKeyChecking=no -i $SSH_KEY ubuntu@3.108.165.10 'bash -s' < ./bash_script_docker.sh

ls -l

exit


