## Laravel Project Guide
#### Run laravel images. 

COMMAND | ABOUT
----- | -----
git clone | Git is a distributed version control system, used mainly in software development, but it can be used to record the edit history of any type of file.
docker | Docker is a container software from the company Docker, Inc, which provides an abstraction and automation layer for operating system virtualization on Windows and Linux.

### Run some commands
>Command docker

#### clone project 

```
git clone git@github.com:guicsmts/laravel-containers.git
````

#### build images container

```
docker build -f Dockerfile -t id/laravel-containers:1.0 .
````

#### list images containers

```
docker images 
````

#### creating container 

```
docker run -d -it --name laravel -p 80:80 id/laravel-containers:1.0 /bin/bash
````

#### list container is running 

```
docker ps 
````

#### running services nginx and php-fpm

```
docker exec id/laravel-containers:1.0 /etc/init.d/nginx start
````

```
docker exec id/laravel-containers:1.0 /home/laravel/local.mylaravel.com/public/php-fpm &
````

#### add the following line to your hosts file

```
sudo echo '127.0.0.1    local.mylaravel.com' >>/etc/hosts
```

#### it's working

```
http://local.mylaravel.com
```