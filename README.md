# Automated Downloading

Files needed to setup automated downloading with Docker, Transmission, OpenVPN, and Sonarr / Radarr

Docker Environment File: https://github.com/drewwats/automated-downloading/blob/main/.env

Docker Compose File: https://github.com/drewwats/automated-downloading/blob/main/docker-compose.yml

## Containers

| App          | Purpose               |
| ------------ | --------------------- |
| BAZARR       | Subtitles             |
| GLUETUN      | VPN                   |
| LIDARR       | Music                 |
| TAULTULLI    | Metrics               |
| PROWLARR     | Index Aggregator      |
| RADARR       | Movies                |
| SABNZBD      | NZB/Usenet Downloader |
| SONARR       | Shows                 |
| TRANSMISSION | Torrent Downloader    |

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
