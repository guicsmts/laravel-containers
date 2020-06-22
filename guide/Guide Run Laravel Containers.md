## Laravel Project Guide
#### Run laravel images. 

COMMAND | ABOUT
----- | -----
git clone | Git is a distributed version control system, used mainly in software development, but it can be used to record the edit history of any type of file.
docker | Docker is a container software from the company Docker, Inc, which provides an abstraction and automation layer for operating system virtualization on Windows and Linux.

### Run some commands
>Command docker

#### clone project 
git clone git@github.com:guicsmts/laravel-containers.git

#### build images container
docker build -f Dockerfile -t id/laravel-containers:1.0 .

#### list images containers
docker images 

#### creating container 
docker run -d -it --name laravel -p 80:80 id/laravel-containers:1.0 /bin/bash

#### list container is running 
docker ps 
