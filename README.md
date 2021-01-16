# ethereum2-docker-compose

Run and monitor an Ethereum 2.0 staking node. Provides multiple `docker-compose.yaml` for different scenarios.

Visit us at [stereum.net](https://stereum.net/) and [Discord](https://discord.gg/8Znj8K6GjN)!

### Links
Service | Pyrmont (Testnet) | Mainnet
--------|-------------------|---------
Block explorer | https://beaconscan.com/pyrmont or https://pyrmont.beaconcha.in/ | https://beaconscan.com/ or https://beaconcha.in/
Ethereum Launchpad | https://pyrmont.launchpad.ethereum.org/ | https://launchpad.ethereum.org/



## First 100 Validators
```
ssh -i "danielw_eth2_validator_new.pem" ubuntu@ec2-13-250-42-164.ap-southeast-1.compute.amazonaws.com

```

## Second 500 Validators

```
ssh -i "danielw_eth2_validator_new.pem" ubuntu@ec2-18-141-208-153.ap-southeast-1.compute.amazonaws.com
```


## Third 500 Validators

## Common Operators

```
sudo docker ps

sudo docker logs --tail 30 ethereum2-docker-compose_geth_1
sudo docker logs --tail 30 ethereum2-docker-compose_beacon_1
sudo docker logs --tail 30 ethereum2-docker-compose_validator_1
sudo docker logs --tail 30 ethereum2-docker-compose_grafana_1
```
restart a single container:

```
sudo docker-compose rm validator

sudo docker-compose stop
sudo docker-compose rm -f
sudo docker-compose pull
sudo docker-compose up -d
sudo docker-compose restart validator
```

## Check DiskSpace

```
cd ETH2
sudo du -sh geth lighthouse-beacon/ lighthouse-validator/
```