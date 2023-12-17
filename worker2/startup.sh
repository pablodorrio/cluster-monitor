#!/bin/bash -e

function install_docker_compose() {
    echo "Installing docker-compose"

    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
}

function install_docker_plugins() {
    echo "Installing docker plugins"

    docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
}

function installations() {
    install_docker_compose
    install_docker_plugins
}

function build() {
    echo "Starting docker-compose"

    docker compose up -d
}

function main() {
    installations
    build
}

main