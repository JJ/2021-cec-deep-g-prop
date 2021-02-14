#!/bin/bash


for i in {1..15}
do
   podman run --rm -t jjmerelo/dgp:1.0.7 -d $1 -ip 64 -mg 32
done
