#!/bin/sh

# This script bootstraps the application

# exit script if there's an error
set -e

# assign SRC_DIR to be the directory that contains the "functions.sh" file
### define functions
SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/scripts/functions.sh

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

set_defaults
gather_options "$@"

case $ENV in
  'development')
    echo "Clearing out old containers"
    teardown_containers "$ENV"
    echo "Setting up $ENV containers"
    setup_containers "$ENV"
  ;;
esac
