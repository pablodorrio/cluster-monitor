# Cluster Monitor

Docker Swarm cluster monitoring with Prometheus

## Setup

### VMs

```bash
docker-machine create manager
docker-machine create worker1
docker-machine create worker2

docker-machine ssh manager
docker-machine ssh worker1
docker-machine ssh worker2
```

### Docker Swarm

```bash
# Manager:
docker swarm init --advertise-addr <manager_IP>

# Output of the command in the workers
```

### Installations
```bash
# Install docker compose (all nodes)
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Install the Grafana Loki Docker Plugin: (workers)
docker plugin install grafana/loki-docker-driver:latest --alias loki --grant-all-permissions
```
### Docker Compose

```bash
# All nodes
docker compose up -d
```
