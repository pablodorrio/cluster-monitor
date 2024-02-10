# Cluster Monitor

Docker Swarm cluster monitoring with Prometheus and Grafana.

## Setup

### Creation and access to VMs

```bash
docker-machine create manager
docker-machine create worker1
docker-machine create worker2

docker-machine ssh manager
docker-machine ssh worker1
docker-machine ssh worker2
```

### Initialize the Docker Swarm Cluster

```bash
# Manager:
docker swarm init --advertise-addr <manager_IP>

# Output of the command in the workers
```

### Configuring and initializing monitoring
- Duplicate the worker folder for the number of nodes you want (in the example there are two workers). 
- Change the IP of the docker-compose.yml file in each worker to the IP of your manager.
- Change the IPs of the prometheus.yml file in the manager to the IPs of your workers.

```bash
# All nodes
./startup.sh
```
