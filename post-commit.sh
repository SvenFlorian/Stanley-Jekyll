#!/bin/bash

branch=$(git symbolic-ref --short HEAD)

if [ "master" == "$branch" ]; then
    # Do something
    # Use 3rd temporary branch
fi