# Launch docker container in aws ec2 using jenkins pipeline(build,test,deploy)


we will see how we can create a jenkins pipeline to build,test, and deploy docker container in aws ec2 instance ,docker container wich we will push in docker hub.

first we need ec2 instance 

then we will craete jenkins pipeline by providing necessery repo url in our case (https://github.com/kardekari/docker-pipeline) wich have all the file named Dockerfile wich will build a conatiner image using all the other files(app.py,requirements.txt,test_app.py etc)

then we have jenkins file wich will build the image using following code

```
stages {
    stage('Build') {
      steps {
        sh 'docker build -t abdullahcodes/docker-test:latest .'
      }
    }
```

then test it. 

after testing we will push docker conatiner to docker hub to push in docker hub we will need to login in docker using credentials we will store docker creds in jenkins globle credentials store then use it as envirment variable 

```
environment {
    DOCKERHUB_CREDENTIALS = credentials('abdullahcodes-dockerhub')
    SSH_KEY               = credentials('sshkey')
  }
```

then we will push the docker image to docker hub 

after that we will now ssh in our ec2 instance for that we will need ssh key so we will store that  key in jenkins globle 
credentials store and use it as a envirment variable 

for that we have bash script bash_script_docker.sh wich have code 

```
ssh -o StrictHostKeyChecking=no -i $SSH_KEY ubuntu@3.108.165.10 'bash -s' < ./bash_script_docker.sh

``` 

now that script will login using ssh key and pull the docker conatiner wich we built and pushed to docker hub  (abdullahcodes/docker-test:latest) and run it on the ec2 instance