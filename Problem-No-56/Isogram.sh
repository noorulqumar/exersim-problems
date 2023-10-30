#!/bin/bash
main()
{
    word="$1"
    word=$( echo "$word" | tr "[:upper:]" "[:lower:]" )
    declare -A associate_array
    len=${#word}

    for (( i=0; i<len; i++ ))
    do
        [[ ${word:i:1} =~ [a-z] ]] && ((associate_array[${word:i:1}]++))
    done
   
    for j in "${!associate_array[@]}"
    do
        a=${associate_array[$j]}
        if (( a >1 ))
        then
            echo "false"
            exit 
        fi
    done
    echo 'true'
}

main "$@"