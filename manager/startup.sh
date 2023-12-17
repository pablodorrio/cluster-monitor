#!/bin/bash -e

function install_docker_compose() {
    echo "Installing docker-compose"

    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
}

function build() {
    echo "Starting docker-compose"

    docker compose up -d
}

function installations() {
    install_docker_compose
}

function main() {
    installations
    build
}

main