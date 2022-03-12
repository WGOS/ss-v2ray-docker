## What's this about?
This is an example of building docker container with Shadowosck and v2ray and launching it via docker-compose

## Security note
This is **definetly NOT** secure setup and here's why:
 - Docker images in docker file are not pinned to certain SHA256
 - Images are set on last versions by default
 - There's no pinning for TLS certificates of GitHub while cloning
 - and so on...

So by default there's a risk of supply chain attacks.