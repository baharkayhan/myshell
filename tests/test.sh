#!/bin/bash
echo "Running test: with the given input..."
echo
make all
outfile=$1
myshellargs=$2
expected=$3

echo  $myshellargs | ./myshell > $outfile &
out=$?
sleep 0.1
if [[ $out == 0 ]] ; then
  echo "Pass: Program exited zero"
else
  echo "Fail: Program did not exit zero"
  exit 1
fi

actual=$(cat $outfile | tr -d '\n')
pid=$(pgrep myshell)

if ! $pid; then
  echo "3"
  kill -9 $pid  
fi

if [[ "$actual" =~ "$expected" ]] ; then
  echo "Pass: output is correct"
  echo "$expected ->> $actual"
else
  echo "Expected '$expected' but got: $actual"
  exit 1
fi

echo
echo "test passed!"
