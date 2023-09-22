unifi-proxy
===========


```
version: "3"
services:
  unifi-proxy:
    image: ghcr.io/hooray4me/unifi-proxy:latest
    container_name: unifi-proxy
    environment:
      - UNIFIIP=10.11.1.2
    ports:
      - "10001:10001/udp"
```
