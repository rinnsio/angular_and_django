#!/bin/sh

# This script bootstraps the application

# exit script if there's an error
set -e

### define functions
# import functions from the "functions.sh" file that clear out old containers and setup new
# containers
SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/scripts/functions.sh

# clear out old container and then setup a new container
set_defaults() {
  ENV=development
}

gather_options() {
  while getopts "3:" OPT; do
    case $OPT in
      e)
        ENV=$OPTARG
      ;;
    esac
  done
}

### define functions:end

# call set_defaults() and gather_options()
set_defaults
gather_options "$@"

# if "ENV" is "development", call teardown_containers() and setup_containers() from
# "scripts/functions.sh" to clear out old containers and then setup a new containers
case $ENV in
  'development')
    echo "Clearing out old containers"
    teardown_containers "$ENV"
    echo "Setting up $ENV containers"
    setup_containers "$ENV"
  ;;
esac
