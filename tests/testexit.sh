#!/bin/bash
echo "Running tests..."
echo
make all
./myshell > 11.txt &
out=$?
pid=$!
echo  "exit" | > /proc/$pid/fd/0
sleep 0.5
pid=$(pgrep myshell)
if ! $pid; then 
  kill -9 $pid  

  echo "Fail: exit test failed."
  exit 1
fi

echo " Pass: exit test passed."
