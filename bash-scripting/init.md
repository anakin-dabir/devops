1. $() - Command Substitution
   Purpose: Used to execute a command and substitute its output into a script or command.
   Usage: Surround the command with $().
   Examples:
   Assigning Command Output to a Variable:

current_date=$(date)
echo "Today's date is: $current_date"
Using Command Output in Another Command:

echo "Files in the current directory: $(ls)"
Notes:
Preferred over backticks (`) because it allows nesting and better readability.
Example of nesting:
nested_output=$(echo $(ls)) 2. $(( )) - Arithmetic Expansion
Purpose: Performs arithmetic operations and expands the result.
Usage: Enclose the arithmetic expression within $(( )).
Examples:
Simple Arithmetic:

sum=$((5 + 3))
echo "Sum: $sum"
Using Variables:

a=10
b=5
result=$((a \* b))
echo "Result: $result"
Increment/Decrement:

counter=1
counter=$((counter + 1))
echo "Counter: $counter" 3. [[]] - Conditional Expressions
Purpose: Used for advanced conditional testing in Bash. It is more flexible and safer than [ ].
Usage: Place the conditional expression inside [[]].
Examples:
String Comparison:

if [[$var == "hello"]]; then
echo "String matches 'hello'"
fi
Regex Matching:

if [[$var =~ ^[0-9]+$]]; then
echo "Variable is numeric"
fi
Logical Operators:

if [[$num -gt 5 && $num -lt 10]]; then
echo "Number is between 6 and 9"
fi
Notes:
Bash-specific and not POSIX-compatible.
No need to quote variables for string comparisons (avoids word splitting). 4. [ ] - POSIX Test Command
Purpose: Performs basic tests for file attributes, string comparisons, and numeric comparisons. It is POSIX-compatible.
Usage: Place the condition inside [ ].
Examples:
String Comparison:

if [ "$var" = "hello" ]; then
echo "String matches 'hello'"
fi
File Check:

if [ -f /path/to/file ]; then
echo "File exists"
fi
Numeric Comparison:

if [ $num -gt 10 ]; then
echo "Number is greater than 10"
fi
Notes:
Requires spaces around operators.
More limited compared to [[]]. 5. { } - Brace Expansion
Purpose: Generates a series of strings or executes a block of commands.
Usage: Enclose the expansion or block within { }.
Examples:
String Expansion:

echo {1..5}

# Output: 1 2 3 4 5

Prefix/Suffix Expansion:

echo file{A,B,C}.txt

# Output: fileA.txt fileB.txt fileC.txt

Command Grouping:

{ echo "Hello"; echo "World"; }
Notes:
In the case of command grouping, {} must be separated from commands by spaces and terminated with a semicolon or newline. 6. (()) - Arithmetic Evaluation
Purpose: Used to evaluate arithmetic expressions and return their value.
Usage: Place the arithmetic expression within (( )).
Examples:
Condition in a Loop:

count=1
while (( count <= 5 )); do
echo "Count: $count"
(( count++ ))
done
Conditional Testing:

if (( 5 > 3 )); then
echo "5 is greater than 3"
fi
Assignment:

(( result = 5 \* 2 ))
echo "Result: $result"
Notes:
Supports C-style operators (++, --, +=, etc.).
More concise for arithmetic comparisons and loops.
