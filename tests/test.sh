#!/bin/bash
# Guncellenecek

echo "Running tests..."
echo
make all
echo  "exit" | ./myshell > out.txt &
sleep 0.5

if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi

actual=$(cat out.txt | tr -d '\n')
pid=$(pgrep myshell)
if ! $pid; then 
  kill -9 $pid  
fi

expected="$"

if [[ "$actual" =~ "$expected" ]] ; then
  echo "Pass: output is correct"
else
  echo "Expected '$expected' but got: $actual"
  exit 1
fi

echo
echo "All tests passed."
