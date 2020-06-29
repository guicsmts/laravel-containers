# Laravel Containers
This repository is for those who are learning or starting a new project on Laravel.

 Application | Version 
|---|---
 Laravel | 7.16.1
 Nginx | 1.14.2
 PHP | 7.4.7
 Maria DB | 10.3.2

## Starting Laravel Containers
>Step by step start containers Laravel.

### Build image
To build the image of Laravel containers, you need to clone the project.

**Step 1** 

Clone repository Laravel containers

```
git clone git@github.com:guicsmts/laravel-containers.git
```
**Step 2**

Check installation Docker, you can execute the command:

```
docker -v
````
For more details you can visit this link:

```
https://www.docker.com/
```
**Step 3**

Build to the image from that command:

```
docker build -f Dockerfile -t id/laravel-containers:1.0 . 
````

*Importantly, you need to be in the same directory as the Dockerfile and the dot makes the command.*






 