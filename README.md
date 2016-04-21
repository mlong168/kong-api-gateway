# kong-api-gateway

## Orchestrated Builds with Docker and Docker-Compose

Build orchestration allows complicated multi-faceted and highly-available distributed systems to be deployed to a high standard and easily packaged and deployed to test/prod environments, resulting in the ability to rapidly, reliably and repeatedly push out enhancements and bug fixes to customers at low risk and with minimal manual overhead. Here’s how it would look. 

## The system was built using the following technologies:
- Docker
- Docker-machine
- Docker-compose
- Docker-swarm -- TBD
- Kong-API-Gateway-with-oAuth2-config-scripts
- Kong-UI
- Multi-Datacenter-Four-NodeDistributed Cassandra Cluster
1. Systems not included but ready for build:
  * API-EndPoints
  * MySQL-NDB

## Running

- Clone Me: 
`git clone https://github.com/NationalSystems/kong-api-gateway.git`
- Run this: 
`cd kong-api-gateway/`
`docker-compose up -d`
- Linux:
`http://127.0.0.1:`
- Mac:
`docker-machine ip`
`http://$ip:8080`
- Windows:
 * Buy a Mac
 * Use Linux
- Configure Kong by command line:
`vi scripts/kong_config.sh`

- Change me:
```
# Change this to 127.0.0.1 if running on linux
host="127.0.0.1"
request_host="testme.com"
upstream_url="https://mockbin.com"
username="bob"
redirect_uri="https://google.com”
Run me:
docker-compose ps
```

![Image of Yaktocat](/img/Kong-APIGateway-Architecture.png?raw=true)
