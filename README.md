# Environment of pyhton [![Open in Gitpod](https://gitpod.io/button/open-in-gitpod.svg)](https://gitpod.io/#https://github.com/gerardo-junior/python-docker.git)


<big><pre>
    [+] AUTHOR:       Gerardo Junior
    [+] EMAIL:        [me@gerardo-junior.com](mailto:me@gerardo-junior.com)
    [+] SITE:         [https://gerardo-junior.com](https://gerardo-junior.com)
    [+] KEYBASE       [https://keybase.io/gerardojunior](https://keybase.io/gerardojunior)
    [+] TELEGRAM:     [@MrGerardoJunior](https://t.me/MrGerardoJunior)
</pre></big>


> The project must be in the **/src** container folder 

## Tags available

| [stable](https://github.com/gerardo-junior/python-docker/blob/master/Dockerfile) | [latest](https://github.com/gerardo-junior/python-docker/blob/develop/Dockerfile) |
|-|-|
| ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/gerardojunior/python?style=for-the-badge&tag=stable) | ![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/gerardojunior/python?style=for-the-badge&tag=lastest) |

## Come on, do your tests

```bash
docker pull gerardojunior/python:stable
```
## How to build

to build the image you need install the [docker engine](https://www.docker.com/) only

> You can try building with different versions of software with docker args, for example: PYTHON_VERSION=3.6

```bash
docker build https://github.com/gerardo-junior/python-docker.git --tag gerardojunior/python
```

## How to use

##### Only with docker command:

```bash
# in your project folder
docker run -it --rm -v $(pwd):/src gerardojunior/python:stable [command]

# or docker-compose
docker-compose run python [command]
```
##### With [docker-compose](https://docs.docker.com/compose/)

Create the docker-compose.yml file  in your project folder with:

```yml
# (...)

  python:
    image: gerardojunior/python:stable
    restart: on-failure
    volumes:
      - type: bind
        source: ./
        target: /src
    #command: dev

# (...)
```

## How to enter image shell
 
```bash
docker run -it --rm gerardojunior/python sh
# or with docker-compose
docker-compose run python sh
```

### License  
This project is licensed under the MIT License - see the [LICENSE](https://github.com/gerardo-junior/python-docker/blob/master/0LICENSE) file for details

