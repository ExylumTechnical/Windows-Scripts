#!/bin/bash

# Basic variuble setting and output
A="A variuble"
B="B variuble"
echo $A
echo $A $B
B="the "$A

# functions for automation
automated_task()
{
  echo $A
}

# implementation of function
automated_task
A="Changed A variuble"
automated_task

# conditionals
C="test_string"
if [ $C=="test_string" ]; then
  echo "the C variuble has not changed"
else
  echo "the C variuble has changed"
fi

# loops
# using numbers in a for loop
echo "Counting to 10"
for i in {1..10}; do
  echo $1
done;

# using a list of variubles in a loop
echo "Naming off animals"
for i in "cat" "dog" "fish"; do
  echo $i
done;

# do a little custom user prompt to demonstrate a case and while statement

# note here that the variuble USERCMD was not defined before and the code still runs
# and that the paramater must be enclosed in parenthisis
while [ "$USERCMD" != "exit" ]; do 
  echo -n "cmd>"; read USERCMD
  case $USERCMD in
    test)
      echo "custom commands work"
    ;;
    help)
      echo "Very limited shell, only supports the commands test and help at this time"
    ;;
  esac;
  done;

