#!/bin/bash
main()
{
    colors="$*"
    value=0
    chk=0
    for i in $colors
    do
        if [[ "$i" = "black" || "$i" = "brown" || "$i" = "red" || "$i" = "orange" || "$i" = "yellow" || "$i" = "green" || "$i" = "blue" || "$i" = "violet" || "$i" = "grey" || "$i" = "white" ]]
        then 
            if [ "$i" = "black" ]
            then
                if (( chk == 0 ))
                then
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    break
                else
                    value=$(( value * 10 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "brown" ]
            then
                if (( chk == 0 ))
                then
                value="1"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="0"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 1 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "red" ]
            then
                if (( chk == 0 ))
                then
                value="2"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="00"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 2 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "orange" ]
            then
                if (( chk == 0 ))
                then
                value="3"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 3 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "yellow" ]
            then
                if (( chk == 0 ))
                then
                value="4"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="0000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 4 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "green" ]
            then
                if (( chk == 0 ))
                then
                value="5"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="00000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 5 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "blue" ] 
            then
                if (( chk == 0 ))
                then
                value="6"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="000000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 6 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "violet" ]
            then
                if (( chk == 0 ))
                then
                value="7"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="0000000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 7 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "grey" ]
            then
                if (( chk == 0 ))
                then
                value="8"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="00000000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 8 ))
                    chk=$(( chk + 1 ))
                fi
            elif [ "$i" = "white" ]
            then
                if (( chk == 0 ))
                then
                value="9"
                chk=$(( chk + 1 ))
                elif (( chk == 2 ))
                then
                    value+="000000000"
                    break
                else
                    value=$(( value * 10 ))
                    value=$(( value + 9 )) 
                    chk=$(( chk + 1 ))
                fi
            fi
            else
               echo "Invalid Color"
               exit 1
            fi
    done
len=${#value}
back_up=$value
if (( len >= 4 ))
then
    lenght=$len
    count=0
    for (( i=len - 1; i>=0; i-- ))
    do
        if [[ "${value:i:1}" = "0" ]]
        then
            if (( count%3 == 0 && lenght == 3 ))
            then
                break
            else
            count=$(( count + 1 ))
            value="${value:0:i}${value:len}"
            lenght=$(( lenght - 1 ))
            fi
            
        else
            break
        fi
    done
    #echo $count
    if (( count <= 3 ))
    then
    echo "$back_up ohms"
    elif [[ $count == 3 ]]
    then
    echo "$value kiloohms"
    elif [[ $count == 6 ]]
    then
    echo "$value megaohms"
    elif [[ $count == 9 ]]
    then
    echo "$value gigaohms"
    else
        echo "$value ohms"
    fi
    
else
    echo "$value ohms"
fi
}

main "$@"