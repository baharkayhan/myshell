#!/bin/bash
tno=$1
command=$2
#todo change command into various tests 
case $tno in
    1)
    echo "test $ sign with empty input"
    bash test_input.sh $tno.txt "" "$"
    ;;
    2)
    echo "test $ sign with line feed"
    bash test.sh $tno.txt "\n" "$"
    ;;
    3)
    echo "test exit"
    bash testexit.sh
    ;;
    4)
    bash test.sh $tno.txt "ls  myshell" "myshell"
    ;;
    5)
    bash test.sh $tno.txt "ls  ../README*" "README"
    ;;
    *)
    ;;
esac