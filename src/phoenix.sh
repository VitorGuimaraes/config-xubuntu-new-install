#!/bin/bash

printf "\nInstalling Phoenix...\n\n"

mkdir -p logs 
printf "" > logs/logs_phoenix.txt

printf "************************ $(date +"%D %T") ************************ 
ā mix local.hex --force \n%s" \
"$(mix local.hex --force )" \
| tee -a logs/logs_phoenix.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
ā mix archive.install hex phx_new --force \n\n%s" \
"$(mix archive.install hex phx_new --force)" \
| tee -a logs/logs_phoenix.txt

printf "\n\n************************ $(date +"%D %T") ************************ 
ā sudo apt install inotify-tools -y\n\n%s"
"$(sudo apt install inotify-tools -y)" \
| tee -a logs/logs_phoenix.txt


phoenix_check=$(ls ~/.mix/archives | grep "phx")
clear

if [[ "$phoenix_check" == *"phx_new"* ]]; then
    printf "\n\n************************ $(date +"%D %T") ************************" \
    | tee -a logs/logs_phoenix.txt
    printf "\nā mix phx.new --version\n" | tee -a logs/logs_phoenix.txt 
    printf "$(mix phx.new --version) \n" | tee -a logs/logs_phoenix.txt 
    printf "Phoenix installed!"
else
    printf "Phoenix not installed! Check log for errors..."
    sleep 2
fi
printf "\n*******************************************************************\n"