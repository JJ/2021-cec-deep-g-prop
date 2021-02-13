#!/bin/bash


for i in {1..4}
do
   evomlp -d $1 -ip 64 -mg 32
done
