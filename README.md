Adds docker-compose to the [official docker image](https://hub.docker.com/_/docker/). 

Can be used for docker-in-docker in GitLab like this:

```
  image: jonaskello/docker-and-compose:1.12.1-1.8.0
  services:
    - docker:1.12.1-dind
```

Each branch in this repo corresponds to a docker image in the format [docker-version]-[docker-compose-version].
