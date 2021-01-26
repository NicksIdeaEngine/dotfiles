#!/bin/bash
# strict mode
set -euo pipefail
IFS=$'\n\t'

#!/bin/bash -u
# ==============================================================================
# Description
# -----------
# Show the content of an array by displaying each element separated by a
# vertical bar (|).
#
# Arg Description
# --- -----------
# 1   The array
# ==============================================================================
show_array()
{
    declare -a arr=("${@}")
    declare -i len=${#arr[@]}
    # Show passed array
    for ((n = 0; n < len; n++))
    do
        echo -en "|${arr[$n]}"
    done
    echo "|"
}

# ==============================================================================
# Description
# -----------
# This function takes two arrays as arguments together with their sizes and a
# name of an array which should be created and returned from this function.
#
# Arg Description
# --- -----------
# 1   Length of first array
# 2   First array
# 3   Length of second array
# 4   Second array
# 5   Name of returned array
# ==============================================================================
array_demo()
{
    declare -a argv=("${@}")                           # All arguments in one big array
    declare -i len_1=${argv[0]}                        # Length of first array passad
    declare -a arr_1=("${argv[@]:1:$len_1}")           # First array
    declare -i len_2=${argv[(len_1 + 1)]}              # Length of second array passad
    declare -a arr_2=("${argv[@]:(len_1 + 2):$len_2}") # Second array
    declare -i totlen=${#argv[@]}                      # Length of argv array (len_1+len_2+2)
    declare __ret_array_name=${argv[(totlen - 1)]}     # Name of array to be returned

    # Show passed arrays
    echo -en "Array 1: "; show_array "${arr_1[@]}"
    echo -en "Array 2: "; show_array "${arr_2[@]}"

    # Create array to be returned with given name (by concatenating passed arrays in opposite order)
    eval ${__ret_array_name}='("${arr_2[@]}" "${arr_1[@]}")'
}

########################
##### Demo program #####
########################
declare -a array_1=(Only 1 word @ the time)                                       # 6 elements
declare -a array_2=("Space separated words," sometimes using "string paretheses") # 4 elements
declare -a my_out # Will contain output from array_demo()

# A: Length of array_1
# B: First array, not necessary with string parentheses here
# C: Length of array_2
# D: Second array, necessary with string parentheses here
# E: Name of array that should be returned from function.
#          A              B             C              D               E
array_demo ${#array_1[@]} ${array_1[@]} ${#array_2[@]} "${array_2[@]}" my_out

# Show that array_demo really returned specified array in my_out:
echo -en "Returns: "; show_array "${my_out[@]}"
