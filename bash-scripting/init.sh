#!/bin/bash

echo "Hello World!"
echo "System uptime is: "
uptime

echo "Memory: "
free -h

echo "Disk Space: "
df -h

## variables
VAR=1
VAR2="2"
echo $VAR $VAR2 

## arguments (that we give after the comand)
echo "$0"  # (it is the actual name of script)
echo $@ # if not given empty will printed
 
## $0 - The name of the Bash script.
# $1- $9 - The first 9 arguments to the Bash script. (Asmentioned above.)
# $# - How many arguments were passed to the Bash script.
# $@ - All the arguments supplied to the Bash script.
# $7 - The exit status of the most recently run process.
# $$ - The process ID of the current script.
# $USER - The username of the user running the script.
# $HOSTNAME - The hostname of the machine the script is running on.
# $SECONDS - The number of seconds since the script was started.
# $RANDOM - Returns a different random number each time is it referred to.
# $LINENO - Returns the current line number in the Bash script.
# $? - the exit status of the last executed command. (0: Indicates success)

# escape character (\: the next letter will be ignored and printed as it is)

# string literals (`` and $(): are used when we have to store command in variable) 
echo `uptime`
echo $(uptime)

free -h
MEMORY=`free -h | grep Mem | awk '{print $4}'`
echo "Free Memory is $MEMORY mb"

## export : make variable global for all child shells but temporary
    #   for permanent i have to store it in .bashrc/.profile file (separate for every user), if i want global then (/etc/profile) file that is in root user and it is for all users
    #   source .bashrc means i am executing this file
    
# input
read -p "USERNAME: " USR # read with prompt
read -sp "PASSWORD: " PWD # read with prompt and suppress input (i.e., password)
echo
echo $USR is logged in with password $PWD

# if statements
read -p "Number: " NUM
if [ $NUM -gt 100 ]
then 
    echo "Yes number is greater than 100"
    date
elif [ $NUM -eq 1 ]
then
    echo "EQUAL ..."
else
    echo "HEHE no it isn't"
fi

# Single brackets (POSIX-compatible)
if [ "$1" = "hello" ]; then
    echo "Hello!"
fi

# Double brackets (Bash-specific)
if [[ $1 =~ ^[Hh]ello$ ]]; then
    echo "Hello or hello!"
fi

# loops
for fruit in apple banana cherry; do
    echo "I like $fruit"
done

for i in {1..5}; do
    # commands
done

for i in $(seq 1 2 10); do
    echo "Step: $i"
done

count=1
while [ $count -le 5 ]; do
    echo "Count: $count"
    count=$((count + 1))
done

for ((i = 1; i <= 5; i++)); do
    echo "Number: $i"
done