#!/bin/bash

CONTAINER_NAME=all_php-fpm_1
if(( $(docker ps --filter name=${CONTAINER_NAME} --filter status=running  --filter status=restarting | wc -l) == 1)) 
then
  exit
fi

docker exec ${CONTAINER_NAME} execute_file_name
