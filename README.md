_this document is entitled to be updated before release of subjected product_
# Introduction to gijeli+
GiJeLi is a subtraction of the words Git, Jekyll and Liquid which is the technology stack behind the GitHub Pages technology. At Praqma: The entire technology stack is wrapped up in a single Docker image - Including dynamic link validation. The docker images is used on clients during development and on Jenkins slaves as part of the continuous delivery pipeline in combination with the Josra Automated Git flow and the Git pretested integration plugin.

gijeli entertains _Power User_ and regular _User_

## Pre-reqs.

Linux - Have Docker up'n'running

Mac. & Windows - Have Boot2Docker up'n'running

>Note:- _make sure your source directory allows read and write permission to the running program it is required for writing validation report into your source directory_

## Pull docker image
Run the given command to pull the latest image of gijeli+:
```
$ docker pull alipraqma/validator

```
# Usage:
###1. Power User
```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator <jekyll/linkchecker command>

Windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator <jekyll/linkchecker command>
```
## Examples:
Being a power user you can exploit all features of tools bunddled in gijeli, **jekyll** and **linkchecker**  

- given example is for serving jekyll pages located on **_Present Working Directory_** and watch changes that are made after serving pages, for more jekyll features see [this link](http://jekyllrb.com/docs/usage/)

```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator jekyll serve --watch --force_polling -H 0.0.0.0
→ access web pages at http://localhost:<port>

Windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator jekyll serve --watch --force_polling -H 0.0.0.0
→ access web pages at http://<boot2docker IP>:<port>
```
- given example runs linkchecker on provided URL for pages rendered outside of container and stores validation report in html format, for more linkchecker features see [this link](http://wummel.github.io/linkchecker/) 

running linkchecker rquires _write permission_ to mounted directory which is _Present Working Directoy_ in this example
```
linux / Mac:
$  docker run -v $(pwd):/data alipraqma/validator linkchecker --check-css --check-html --complete --anchors --quiet -F=html/<directory-name>/<file-name>.html <URL>

windows:
$ docker run -v $(pwd):\\data alipraqma/validator linkchecker --check-css --check-html --complete --anchors --quiet -F=html/<directory-name>/<file-name>.html <URL>

→ report will be saved in <directory-name> under <file-name> in Present Working Directory

```

###2. User
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

## Examples:
#### Build

change your terminal’s present working directory to the source directory you want to build your jekyll project in, and run the following command:
```
linux / Mac:
$ docker run -v $(pwd):/data alipraqma/validator build

windows:
$ docker run -v $(pwd):\\data alipraqma/validator build
```

#### Serve

change your terminal's working present directory to the directory containing your jekyll web project and run the following command:
```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator serve
→ access your  web at pages http://localhost:<port>

windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator serve
→ access your  web pages at http://<boot2docker IP>:<port>
```

#### Check (Write permission required)

_Use this option if your web project is NOT rendered into a container_

change your terminal's present working directory to the directory you want to keep your linkchecker report and run the following command:

```
linux / Mac:
$  docker run -v $(pwd):/data alipraqma/validator check <URL: for example. http://www.code-conf.com>

windows:
$ docker run -v $(pwd):\\data alipraqma/validator check <URL: for example http://www.code-conf.com>

→ report will be saved in folder <report> under name <site_reprot.html>, in your mounted directory
```
#### Serve Check (write permission required)
_Use this option to serve and check your web project into the same container_

change your terminal's present working directory to the directory containing your jekyll web project and run the following command:
```
linux / Mac:
$ docker run -v $(pwd):/data -p <port>:4000 alipraqma/validator serve check
→ access your  web pages at http://localhost:<port>

windows:
$ docker run -v $(pwd):\\data -p <port>:4000 alipraqma/validator serve check
→ access your  web pages at http://<boot2docker IP>:<port>

→ linkchecker report will be saved in folder <report> under name <site_reprot.html>, in your mounted directory
```
# Handy Hacks:
Are you a “one container for one process” kind of guy ?
>You can benefit out of docker “--link” option to serve and check your website in separate containers, using gijeli image

A dev. geek?... want to juggle all of the “jekyll” and “linkchecker” within gijeli image?
>explore docker  “--entrypoint=/bin/bash” and sneak into the image
