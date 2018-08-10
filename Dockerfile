# start from the base image "python", then build on this image by adding the rest of the code 
# in this file

# once "docker build" is run, python will be installed
FROM python:3.7.0

# update all the applications, then install shellcheck (a package that check to see if you 
# have good coding behavior)
RUN apt-get update && apt-get install -qq -y \
  shellcheck

# change the starting directory to "/usr/src/app/" once you're in the container by running 
# "docker-compose run (container_name (first_line_under_"services")) bash"
WORKDIR /usr/src/app/

COPY requirements.txt /usr/src/app/requirements.txt
RUN mkdir -p /usr/src/app/scripts/
COPY scripts/install_dependencies.sh /usr/src/app/scripts/install_dependencies.sh
RUN scripts/install_dependencies.sh /usr/src/

COPY . /usr/src/app/
