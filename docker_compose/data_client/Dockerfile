# Specify which docker image we take as the source
FROM ubuntu:20.04

# We indicate what actions should be performed 
# for the selected docker image with the current state

# Updating package indices of available repositories
RUN apt-get update

# Install the specified packages
RUN apt-get install -y curl nano python3-pip python3.9 python3.9-dev wget

# Set up alternate paths for installing Python 3.9 packages with priority. 
# In this case, the lowest priority (0)
RUN update-alternatives --install /usr/bin/python3 python3.9 /usr/bin/python3.9 0

# Set the tool for controlling the working environment in Python
RUN pip3 install pipenv

# Import the GPG key and add the PostgreSQL 12 repository to our Ubuntu machine
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -

# Add the PostgreSQL apt repository to the system in accordance with the above operating system. 
# They are offered on the official PostgreSQL website with the following command
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee  /etc/apt/sources.list.d/pgdg.list

# Installing tools for working with PostgreSQL and MongoDB DBMS
RUN apt-get install -y postgresql-client-12 mongodb mongo-tools


# Setting up the working environment
ENV \
    PIPENV_VENV_IN_PROJECT=1 \
    PIPENV_CACHE_DIR=/www/app/.cache/pipenv \
    PIP_CACHE_DIR=/www/app/.cache/pip \
    LC_ALL=C.UTF-8 \
    LANG=C.UTF-8


# Set the working directory for the next instruction
WORKDIR "/www/app"


# Copy the specified files and folders to the container
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh


# We provide access to the execution of the specified instructions for any user (https://pingvinus.ru/note/chmod)
RUN chmod +x /usr/local/bin/docker-entrypoint.sh


# Command with arguments to be called during container execution. 
# Arguments are not overridden.
ENTRYPOINT ["docker-entrypoint.sh"]
