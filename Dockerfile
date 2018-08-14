# start from the base image "python", then build on this image by adding the rest of the code 
# in this file

# once "docker-compose build" is run, python will be installed
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

# copy everything from host (everything under current directory) into the container (into the 
# "/usr/src/app/" directory) so when you first build the container by running
# "docker-compose build", you will have the most updated copy of the code to start of with.
# always do this last since we are not running the "docker-compose.yml" file in production
# (no files will be synchronizing between the host and the container after we run
# "docker-compose build"), so this make sure you have the most updated copy of the code before
# putting into production or before start making changes in development.
COPY . /usr/src/app/
