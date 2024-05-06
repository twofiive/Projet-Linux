#!/bin/bash

awk -F ';' '$4 >= 20 && $4 <= 30  {print $2";"$3";"$6}' fake-users-base.csv > utilisateur_mail.txt