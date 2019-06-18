# wireguard-docker

A Docker image containing Wireguard that enables containerized
VPNs. Containers that use this image can provide VPN services to other
Docker containers by sharing the same Docker network.

This fork modifies it to use Alpine Linux. **Please note that this doesn't install the WireGuard kernel module so you'll have to do it on your own.**

## Image

An up-to date Docker image can be found on Dockerhub at
`ronthecookie/wireguard-docker`. 
## Usage

### Configuration

A volume has to be mounted at `/etc/wireguard` containing a single
configuration file with a `.conf` extension corresponding to the VPN
interface.

More information about the structure of this file can be found in the
Wireguard man page and on its [website](https://www.wireguard.com/).

Note: if Wireguard is running as a server, the UDP port that it
listens on has to be exposed from the container.

### Permissions

When running a container based upon this image, the following system
capabilities are necessary:
- NET_ADMIN
- SYS_MODULE

### Example `docker run` command

```bash
docker run -it --rm --cap-add net_admin --cap-add sys_module \
       -v ./wireguard:/etc/wireguard \
       -p 5555:5555/udp ronthecookie/wireguard-docker
```

## Inspiration
Thanks to [Active EOS](https://github.com/activeeos/wireguard-docker) for making the original project I forked this from.

Thanks to Nick Babcock for his [blog
post](https://nbsoftsolutions.com/blog/routing-select-docker-containers-through-wireguard-vpn)
explaining the mechanics behind running Wireguard inside of a
container.
