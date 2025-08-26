#!/bin/bash

function refreshtime
{
    timestamp="`date +%Y%m%d_%H:%M:%S`"
    fulldate="`date +%Y%m%d_%H%M%S`"
}
refreshtime

export DOCKER_GATEWAY_HOST=172.17.0.1

clear
pwd
printf "\n\e[1;32m-----------------------------------------------------------------------\e[0m\n"
refreshtime
printf "\n\e[1;32m$timestamp - Starting Docker Update ($(basename $0)) now...\e[0m\n"

git_dir=/Docker

cd $git_dir

refreshtime
printf "\n\e[1;32m$timestamp - Pulling any new images...\e[0m\n\n"
$(which docker) compose pull

refreshtime
printf "\n\e[1;32m$timestamp - Restarting any new containers and removing orphans...\e[0m\n\n"
$(which docker) compose up -d --remove-orphans

refreshtime
printf "\n\e[1;32m$timestamp - Removing unused images...\e[0m\n\n"
$(which docker) image prune -f

refreshtime
printf "\n\e[1;32m$timestamp - Removing unused containers...\e[0m\n\n"
$(which docker) container prune -f

refreshtime
printf "\n\e[1;32m$timestamp - Images on disk...\e[0m\n\n"
$(which docker) images -a --format "table {{.Repository}}\t{{.CreatedSince}}\t{{.Size}}" | grep -e "^" -e "hours" -e "hour"

refreshtime
printf "\n\e[1;32m$timestamp - Containers on disk...\e[0m\n\n"
$(which docker) ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Size}}" | grep  -e "^" -e "hours" -e "hour"

if [[ "$(whoami)" == "admin" ]]; then
    refreshtime
    printf "\n\e[1;32m$timestamp - Running startup scripts...\e[0m\n\n"
    eval /Docker/homes/prowlarr/socks_fix.sh
fi

printf "\n\e[1;34m-----------------------------------------------------------------------\e[0m\n\n"
