#!/bin/bash
main()
{
    type="$1"
    a="$2"
    len=${#a}
    if [ $type = "decode" ]
    then
        if [ "$a" = "" ]
        then
            exit 
        fi
        for ((i=0; i<len; i++ ))
        do
            if [[ ${a:i:1} =~ [0-9] ]]
            then
                number=${a:i:1}
                for (( j=i+1; j<len; j++ ))
                do
                    if [[ ${a:j:1} =~ [0-9] ]]
                    then
                        number=$(( number * 10 ))
                        number=$(( number + ${a:j:1} ))
                        i=$(( i + 1 ))
                    else
                        break
                    fi
                done
                echo $number
                char="${a:$((i+1)):1}"
                for (( j=0; j<number; j++ ))
                do  
                    string+="$char"
                done
                i=$(( i + 1 ))
            else
                string+=${a:i:1} 
            fi
        done
    elif [ $type = "encode" ]
    then
        if [ "$a" = "" ]
        then
            exit 
        fi
        string=""
        count=0
        for (( i=0; i<len; i++ ))
        do
            if (( i == 0 ))
            then
                count=$(( count + 1 ))
            else
                if [ "${a:i:1}" = "${a:$((i - 1 )):1}" ]
                then
                    count=$(( count + 1 ))
                else
                    if ((count != 1 ))
                    then
                        string+=$count
                    fi
                    string+=${a:$((i - 1 )):1}
                    count=1
                fi
            fi
        done
         if ((count != 1 ))
        then
            string+=$count
        fi
        
        string+=${a:$((i - 1 )):1}
    fi
    echo "$string"
}

main "$@"