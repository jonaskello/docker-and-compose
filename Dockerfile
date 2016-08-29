FROM ubuntu:16.04

# Install curl so we can get the other binaries
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

# Install only the docker client binary
RUN curl -L https://get.docker.com/builds/Linux/x86_64/docker-1.12.1.tgz > docker.tgz
RUN tar -xvzf docker.tgz
RUN cp docker/docker /usr/local/bin/docker
RUN rm -rf docker

# Get the docker-compose binary
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Verify installation
RUN docker -v
RUN docker-compose -v
