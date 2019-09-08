#!/usr/bin/env bash

planet=$1
seconds=$2
earth_seconds=31557600

convert(){
    pct_of_earth_orbit=$1
    result=$((seconds/(earth_seconds*pct_of_earth_orbit)))
}


