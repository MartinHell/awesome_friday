#!/bin/bash

set -e
set -u

server=$1
nova get-password ${server} | openssl enc -base64 -d | openssl rsautl -decrypt -inkey ~/.ssh/id_rsa -keyform PEM
