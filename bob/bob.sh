#!/usr/bin/env bash

# using gnu printf on osx
textin="$(gprintf %b "${1}" 2>/dev/null)"

textin="${textin//[[:space:]]/}"


[[ "${textin}" == "" ]] && echo "Fine. Be that way!" && exit 0


[[ "$textin" == *[[:upper:]]* ]] && [[ "$textin" != *[[:lower:]]* ]] &&	echo "Whoa, chill out!" && exit 0


[[ "${textin: -1}" == "?" ]] && echo "Sure." && exit 0


echo "Whatever."

