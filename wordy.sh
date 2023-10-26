#!/bain/bash
main()
{
    a="$1"
    result=0
    a=$( echo $a |tr -d "?" )

    number1=0
    number2=0
    operation=""
    result=0;
    for i in $a
    do
        if [[ $i =~ [0-9] ]] && (( number1 == 0 ))
        then
            number1=$i
        elif [[ $i =~ [a-zA-Z] ]]
        then    
                if [[ "$i" = "plus" || "$i" = "minus" || "$i" = "multiplied" || "$i" = "divided" ]] && (( number1 != 0 )) 
                then
                    if [ "$operation" != "" ]
                    then
                        echo "syntax error"
                        exit 2
                    fi
                    operation=$i
                else
                    if (( number1 != 0 ))
                    then
                        if [ "$operation" = "" ]
                        then
                            echo "unknown operation"
                            exit 2
                        fi
                    fi
                    if (( number1 == 0 ))
                    then
                        if [[ "$i" = "plus" || "$i" = "minus" || "$i" = "multiplied" || "$i" = "divided" ]]
                        then
                            echo "syntax error"
                            exit 2
                        fi
                    fi
                    continue
                fi
        elif [[ $i =~ [0-9] ]] && (( number1 != 0 ))
        then
            number2=$i
            if [ "$operation" != "" ]
            then
                if [ "$operation" = "plus" ]
                then
                    result=$(( number1 + number2 ))
                    number1=$result
                    
                elif [ "$operation" = "minus" ]
                then
                    result=$(( number1 - number2 ))
                    number1=$result
                elif [ "$operation" = "multiplied" ]
                then
                    result=$(( number1 * number2 ))
                    number1=$result
                elif [ "$operation" = "divided" ]
                then
                    result=$(( number1 / number2 ))
                    number1=$result
                fi
                operation=""
            else
                echo ""syntax error""
                exit 2
            fi
        fi
    done
    if (( number1 != 0 )) && [ "$operation" = "plus" ] && (( number2 == 0 )) 
    then
        echo "syntax error"
        exit 2
    elif (( number1 == 0 )) && [ "$operation" = "" ] && (( number2 == 0 )) && (( ${#a} <= 10 ))
    then
        echo "syntax error"
        exit 2
    elif [[ "$number1" == 0 && "$operation" = "" ]]
    then
        echo "unknown operation"
        exit 2
    elif [ "$operation" = "" ]
    then
        echo $number1
    else
        echo $result
    fi
}    
main "$@"
