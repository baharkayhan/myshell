#!/bin/bash
tno=$1
command=$2
#todo change command into various tests 
case $tno in
    1)
    echo "test $ sign with empty input"
    bash test.sh $tno.txt "" "$"
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
    6)
    msg=`tr -dc A-Za-z0-9 </dev/urandom | head -c 13;`
    bash test.sh $tno.txt "./tprog1.sh $msg" $msg$msg
    ;;
    7)
    msg=`tr -dc A-Za-z0-9 </dev/urandom | head -c 13;`
    n=`tr -dc 0-9 </dev/urandom | head -c 1;`
    nmsg=""
    for (( i=1; i<=$2; i++ ))
    do
        nmsg=$nmsg$msg
    done
    bash test.sh $tno.txt "./tprog2.sh $msg $n" $nmsg
    ;;
    8)
    echo "test locate:"
    mv tprog1.sh ../
    msg=`tr -dc A-Za-z0-9 </dev/urandom | head -c 13;`
    bash test.sh $tno.txt "./tprog1.sh $msg" $msg$msg
    ;;
    9)
    bash test.sh $tno.txt "hofff"  "not found"
    ;;
    *)
    ;;
esac