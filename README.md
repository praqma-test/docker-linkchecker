_this document is entitled to be updated before release of subjected product_
# Introduction to gijeli+ 
GiJeLi is a subtraction of the words Git Jekyll and Liquid which is the technology stack behind the GitHub Pages technology. At Praqma: The entire technology stack is wrapped up in a single Docker image - Including dynamic link validation. The docker images is used on clients during development and on Jenkins slaves as part of the continuous delivery pipeline in combination with the Josra Automated Git flow and the Git pretested integration plugin.

## Pre-reqs.

Linux - Have Docker up'n'running 

Mac. & Windows - Have Boot2Docker up'n'running 

>Note:- _make sure your source directory allows read and write permission to the running program it is required for writing validation report into your source directory_

## Pull docker image
Run the given command to pull the latest image of gijeli+:
```
$ docker pull alipraqma/validator

```
# Usage
```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator <option>

Windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator <option>
```
### Options

1. build _(build jekyll pages project in mounted directory)_
2. serve _(renders jekyll web site located in mounted directory)_
3. check _(runs linkchecker on provided URL-for pages rendered outside of container)_
4. serve check _(serves jekyll pages and runs linkchecker on served pages within the same container)_

# Examples
#### Build

change your terminal’s present directory to the source directory you want to build your jekyll project in, and run the following command: 
```
linux / Mac:
$ docker run -v $(pwd):/data alipraqma/validator build

windows:
$ docker run -v $(pwd):\\data alipraqma/validator build
```

#### Serve 

change your terminal's present directory to the directory containing your jekyll web project and run the following command:
```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator serve

windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator serve

→ access your  web pages http://<boot2docker IP>:<port>
```


#### Check (Write permission required)

_Use this option if your web project is NOT rendered into a container_

change your terminal's present directory to the directory you want to keep your linkchecker report and run the following command:

```
linux / Mac:
$  docker run -v $(pwd):/data alipraqma/validator check <URL: for example. http://www.code-conf.com>

windows:
$ docker run -v $(pwd):\\data alipraqma/validator check <URL: for example http://www.code-conf.com>

→ report will be saved in folder <report> under name <site_reprot.html>, in your mounted directory
```
#### Serve Check (write permission required)
_Use this option to serve and check your web project into the same container_

change your terminal's present directory to the directory containing your jekyll web project and run the following command:
```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator serve check

windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator serve check 

→ access your  web pages http://<boot2docker IP>:<port>
→ linkchecker report will be saved in folder <report> under name <site_reprot.html>, in your mounted directory 
```
# Handy Hacks
Are you a “one container for one process” kind of guy ?
>You can benefit out of docker “--link” option to serve and check your website in separate containers, using gijeli image

A dev. geek?... want to juggle all of the “jekyll” and “linkchecker” within gijeli image?
>explore docker  “--entrypoint=/bin/bash” and sneak into the image
