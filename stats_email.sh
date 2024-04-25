#!/bin/bash

awk -F ';' '{
        email[NR] = $6
        }
        END {
        asort(email)
        for (i = length(email); i >= 1; i--){
                print email[i]
        }
}' ./fake-users-base.csv
