#!/bin/sh

# teardown_containers
#
# clear out containers of any remnants of the application
#
# example usage: teardown_containers

# if "ENV" is "development", shutdown any running docker containers
teardown_containers() {
  local environment=$1

  case $environment in
    'development')
      docker-compose down -v
    ;;
  esac
}

# setup_containers
#
# set up containers to run application
#
# example usage: setup_containers

# if "ENV" is "development", build new docker containers
setup_containers() {
  local environment=$1

  case $environment in
    'development')
      docker-compose build
    ;;
  esac
}
