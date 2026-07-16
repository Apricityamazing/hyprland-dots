#! /bin/bash

phrases[0]="Resonance is beauty."
phrases[1]="? after a ? tends to be ?"
phrases[2]="KEEP YOUR GRACE NOTES DOWN!"
phrases[3]="That was the worst rep we have ever had"
phrases[4]="I am not blaming you, but it is your fault"
phrases[5]="HELTERS SKELTERS or wait HEEBIE JEEBIES?, oh jeeper creepers"
phrases[6]="Get DOWN Mr.President PEWWW"
phrases[7]="Ayo I made it out of the basement no biggie"
phrases[8]="I dun escape the diddy's"
phrases[9]="KALEA NOOOOOOOOOOOOOOOOO"
phrases[10]="1-3 5-7 9-11 was an inside job"

size=${#phrases[@]}
index=$(($RANDOM % $size))
echo ${phrases[$index]}
