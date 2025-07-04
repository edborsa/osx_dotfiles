#!/bin/bash
command=$(cat ~/.zsh_history | sed 's/^\:[^;]*;//g' | awk '!a[$0]++' | fzf --tac)

if [[ $command == "" ]]; then
	exit 1
fi

echo -e "Press enter to execute:\n$command"
read -s -n 1 key

if [[ $key = "" ]]; then
	$command
fi
