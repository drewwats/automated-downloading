# Automated Downloading

Files needed to setup automated downloading with Docker, Transmission, OpenVPN, and Sonarr / Radarr

Docker Environment File: https://github.com/drewwats/automated-downloading/blob/main/.env

Docker Compose File: https://github.com/drewwats/automated-downloading/blob/main/docker-compose.yml

DNS File: https://github.com/drewwats/automated-downloading/blob/main/resolv.conf

## Notes

* Running container-station on QNAP
* Plex app (not container) on QNAP

## File Structure
```
/
- Docker
- - homes/
- - - bazarr/
- - - gluetun/
- - - lidarr/
- - - metrics/
- - - pia-vpn/
- - - prowlarr/
- - - - socks_fix.sh
- - - radarr/
- - - sabnzbd/
- - - sonarr/
- - - transmission/
- - .env
- - docker-compose.yml
- - update_docker.sh
```
