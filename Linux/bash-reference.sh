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


