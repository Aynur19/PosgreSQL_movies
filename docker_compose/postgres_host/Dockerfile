# Specify which docker image we take as the source
FROM postgres:12.4-alpine


# Copy files and folders to the container. 
# It is possible to unpack local .tar files
ADD create_tables.sql /docker-entrypont-initdb.d/
