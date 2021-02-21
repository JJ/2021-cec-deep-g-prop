#!/bin/bash


for i in {1..15}
do
   evomlp -d $1 -ip 64 -mg 48 -lr 1 2
done
