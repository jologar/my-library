# my-library


## Installation

1. Install docker in your system
2. Install docker-compose:
```
$ sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose


$ sudo chmod +x /usr/local/bin/docker-compose
```
3. execute `$ docker-compose build` in the project root to build the image. Be patient :)
4. execute `$ docker-compose run` to start the container from the created image, executing the phoenix app.
5. access the application in *http://localhost:4001*
