#!/bin/bash
# Guncellenecek

echo "Running tests..."
echo
make all
echo  "exit" | ./myshell > out.txt &
if [ $? -eq 0 ] ; then
  echo "Pass: Program exited zero\n"
else
  echo "Fail: Program did not exit zero\n"
  exit 1
fi

output=$(cat out.txt | tr -d '\n')
pid=$(pgrep myshell)
kill -9 $pid 

expected_output="$"


if [[ "$output" =~ "$expected_output" ]] ; then
  echo "Pass: Output is correct"
else
  echo "Expected '$expected_output' but got: $output"
  exit 1
fi

echo
echo "All tests passed."
