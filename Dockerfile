FROM ubuntu:16.04

# Install curl so we can get the other binaries
RUN apt-get update && apt-get install -y curl && apt-get clean && rm -rf /var/lib/apt/lists

# Install Docker from Docker Inc. repositories.
RUN curl -sSL https://get.docker.com/ | sh && \
    apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y docker-engine && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Get the docker-compose binary
RUN curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

# Verify installation
RUN docker -v
RUN docker-compose -v
