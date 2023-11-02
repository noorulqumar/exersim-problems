#!/bin/bash
find_response()
{
        a=$1

        remove=$(echo $a | tr -d " \t\r\n")
        if [[ $remove = '' || $# = 0 ]]
        then
                echo "Fine. Be that way!"
                exit 0
        else
            remove=$(echo "$a" | tr -d -c "a-zA-Z?")
            echo $remove
            len=${#remove}
            if [[ ${remove:$(( $len - 1 )):1} = "?" ]]
            then
                remove=$(echo $remove | tr -d "?")
                echo $remove
                if [[ $remove =~ ^[A-Z]+$ ]] 
                    then
                    echo "Calm down, I know what I'm doing!"
                    exit 0
                else
                    echo "Sure."
                    exit 0
                fi
            elif [[ $remove =~ ^[A-Z]+$ ]]
            then
                    echo "Whoa, chill out!" 
                    exit 0
            else
                echo "Whatever." 
                exit 0
            fi
    fi
}

find_response "$@"