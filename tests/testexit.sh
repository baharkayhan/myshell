#!/bin/bash
echo "Running tests..."
make all
printf "%s\n" "exit" | ./myshell > 11.txt &
sleep 1

pid=$(pgrep myshell)
if [[ $pid > 0 ]]; then 
  kill -9 $pid 
  echo "Fail: exit test failed."
  exit 1
fi

echo " Pass: exit test passed."
