#!/bin/bash

# This script starts the application

# import functions from the "functions.sh" file that clear out old containers and setup new
# containers
SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/functions.sh

# start the python application by starting the server in localhost at port 8000
# to avoid ipv4 to ipv6 converting problem, use "0.0.0.0" instead of "localhost"
python manage.py runserver 0.0.0.0:8000
