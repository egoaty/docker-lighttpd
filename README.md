# egoaty/lighttpd
Lighttpd Server

## Configuration

All files named ```*.conf``` under /config are included in the configuration and can be used to override and/or extend the default configuration.

The **document root** is ```/www``` (without a htdocs/ subdirectory).

## Logging

Logs are written to ```/var/log/access.log``` and ```/var/log/error.log``` as well as to *stdout*.

## Running the container

Docker compose example:

```
version: '2'

services:
  lighttpd:
    image: ghcr.io/egoaty/lighttpd
    environment:
      - PUID=1000
      - PGID=1000
    volumes:
      - ./lighttpd/www:/www
      - ./lighttpd/config:/config
      - ./lighttpd/log:/log
    ports:
      - 80:80
    restart: unless-stopped
```
