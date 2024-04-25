#!/bin/bash

fichier=./fake-users-base.csv
sed -i 's/+33/0/g' $fichier
