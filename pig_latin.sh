#!/bin/bash
main () {
    a=$1
    starting_char=${a:0:1}
    #rule # 1
    if [[ "$starting_char" = "a" ||"$starting_char" = "e" || "$starting_char" = "i" ||"$starting_char" = "o" || "$starting_char" = "u" ]] || [[ "$starting_char" = "x" && ${a:1:1} = "r" || "$starting_char" = "y" && ${a:1:1} = "t" ]]
    then
        a+="ay"
    #Rule# 4
    elif [[ $a =~ ['y'] ]]
    then
        index=0
        for (( i=0; i<${#a}; i++))
        do
            if [ "${a:i:1}" = "y" ]
            then
                index=$i
                break
            else
                b+="${a:i:1}"
            fi
        done
        for (( i=$index; i<${#a}; i++ ))
        do
            c+="${a:i:1}"
        done

        a=""
        a+=$c
        a+=$b
        a+="ay"
     #rule no 2
    elif [[ "$starting_char" != "a" || "$starting_char" != "e" || "$starting_char" != "i" || "$starting_char" != "o" || "$starting_char" != "u" ]] && [[ $starting_char = "c" && ${a:1:1} = "h" ]] || [[ $starting_char = "s" && ${a:1:1} = "t" ]]
    then
        b+=$starting_char
        b+=${a:1:1}
        for (( i=2; i<${#a}; i++ ))
        do
            c+=${a:i:1}
        done
        a=""
        a+=$c
        a+=$b
        a+="ay"
    #rule no 3
    elif [[ "$starting_char" != "a" || "$starting_char" != "e" || "$starting_char" != "i" || "$starting_char" != "o" || "$starting_char" != "u" ]] && [[ $starting_char = "q" && ${a:1:1} = "u" ]]
    then
        b+=$starting_char
        b+=${a:1:1}
        b+=${a:2:1}
        for (( i=3; i<${#a}; i++ ))
        do
            c+=${a:i:1}
        done
        a=""
        a+=$c
        a+=$b
        a+="ay"
    fi
    echo "$a"
}
main "$@"
