#!/bin/bash
echo "Running tests..."
echo
make all
echo  "exit" | ./myshell &
out=$?
sleep 0.5

if [ $out -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi


pid=$(pgrep myshell)
if ! $pid; then 
  kill -9 $pid  
  exit 1
fi

echo " test passed."
