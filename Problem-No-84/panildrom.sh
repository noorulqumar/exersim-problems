#!/bin/bash

declare op="$1"
declare -i min=$2 max=$3
(( min <= max )) || { echo 'min must be <= max'; exit 1; }

is_palindrome () {
    local number=$1 length=${#1}

    (( length == 1 )) && return 0

    local -i i
    for (( i = 0; i < length / 2; i++ )); do
        [[ "${number:$i:1}" != "${number:($length - $i - 1):1}" ]] && return 1
    done
    return 0
}

declare -i i j prod candidate=0
declare factors=''

case "$op" in
    'smallest' )
        for (( i = min; i <= max; i++ )); do
            for (( j = i; j <= max; j++ )); do
                (( prod = i * j ))
                (( candidate > 0 && prod > candidate )) && break
                if is_palindrome "$prod"; then
                    (( candidate == 0 )) && (( candidate = prod )) && factors="[$i, $j]"
                    (( candidate > 0 && prod < candidate )) && (( candidate = prod )) && factors="[$i, $j]"
                    (( candidate == prod )) && factors="$factors [$i $j]"
                fi
            done
        done
    ;;
    'largest' )
        for (( i = max; i >= min; i-- )); do
            for (( j = i; j >= min; j-- )); do
                (( prod = i * j ))
                (( candidate > 0 && prod < candidate )) && break
                if is_palindrome "$prod"; then
                    (( candidate == 0 )) && (( candidate = prod )) && factors="[$j, $i]"
                    (( candidate > 0 && prod > candidate )) && (( candidate = prod )) && factors="[$j, $i]"
                    (( candidate == prod )) && factors="$factors [$j, $i]"
                fi
            done
        done
    ;;
    * ) 
        echo "first arg should be 'smallest' or 'largest'" 
        exit 1 
    ;;
esac

(( candidate > 0 )) && echo "$candidate: $factors"
exit 0