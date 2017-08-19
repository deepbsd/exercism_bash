#!/usr/bin/env bash

thing=$1
[[ echo $thing | grep ! ]] 2>/dev/null && echo 'Whoa, chill out!'