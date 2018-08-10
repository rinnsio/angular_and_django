#!/bin/bash

# This script starts the application

SRC_DIR=$(cd "$(dirname "$0")"; pwd -P)
. "$SRC_DIR"/functions.sh

python manage.py runserver 0.0.0.0:8000
