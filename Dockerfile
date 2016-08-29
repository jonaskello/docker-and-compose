FROM ubuntu:14.04

# Set versions to install
ENV DOCKER_ENGINE_VERSION 1.12.1
ENV DOCKER_COMPOSE_VERSION 1.8.0

# Install curl so we can get the other binaries
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

# Install specific verison of docker-engine
RUN apt-get update
RUN apt-get install apt-transport-https ca-certificates
RUN apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
RUN echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" > /etc/apt/sources.list.d/docker.list
RUN apt-get update
RUN apt-get purge lxc-docker
RUN apt-get install -y docker-engine=$DOCKER_ENGINE_VERSION-0~trusty
RUN service docker start
RUN apt-get clean && rm -rf /var/lib/apt/lists

# Install specific version of docker-compose
RUN curl -L https://github.com/docker/compose/releases/download/$DOCKER_COMPOSE_VERSION/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose
