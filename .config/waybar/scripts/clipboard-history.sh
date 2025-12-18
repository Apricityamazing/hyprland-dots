#! /bin/bash

length=$(cliphist list | wc -l) # Gets length of clipboard history 

if [ "$length" -eq 0 ]; then
    echo "" # Icon for empty history 
else
    echo "" # Icon for active history 
fi

