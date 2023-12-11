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
docker swarm init --advertise-addr 192.168.99.118

# Output of the command in the workers
```

### Installations
```bash
# Install docker compose (all nodes)
DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
mkdir -p $DOCKER_CONFIG/cli-plugins
curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose

# Install loki (workers)
wget https://raw.githubusercontent.com/grafana/loki/v2.9.1/cmd/loki/loki-local-config.yaml -O loki-config.yaml
docker run --name loki -d -v $(pwd):/mnt/config -p 3100:3100 grafana/loki:2.9.1 -config.file=/mnt/config/loki-config.yaml
wget https://raw.githubusercontent.com/grafana/loki/v2.9.1/clients/cmd/promtail/promtail-docker-config.yaml -O promtail-config.yaml
docker run --name promtail -d -v $(pwd):/mnt/config -v /var/log:/var/log --link loki grafana/promtail:2.9.1 -config.file=/mnt/config/promtail-config.yaml
```
### Docker Compose

```bash
# All nodes
docker compose up -d
```
