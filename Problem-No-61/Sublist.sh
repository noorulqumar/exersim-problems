#!/bin/bash
main()
{
    a=($1)
    b=($2)


    len_A=${#a[@]}
    len_B=${#b[@]}
    if (( len_A == len_B ))
    then
        for (( i=0; i<len_A; i++ ))
        do
            if [ "${a[i]}" == "${b[i]}" ]
            then
                continue
            else
                echo 'unequal'
                exit
            fi
        done
        echo "equal"
    elif (( len_A != len_B))
    then
        if (( len_A == 1 ))
        then
            echo "sublist"
            exit
        elif (( len_B == 1 ))
        then
            echo "superlist"
            exit
        fi
        if (( len_A > len_B ))
        then
            if (( len_A == 0 ))
            then
                echo "sublist"
                exit
            elif (( len_B == 0 ))
            then
                echo "superlist"
                exit
            fi
            for (( j=0; j<len_A; j++ ))
            do 
                x=$( echo "${a[j]}" | tr -d -c "0-9" )
                y=$( echo "${b[0]}" | tr -d -c "0-9" )
                if (( x == y ))
                then
                    check=1
                    for (( k=0; k<len_B; k++ ))
                    do  
                        x=$( echo "${b[k]}" | tr -d -c "0-9" )
                        y=$( echo "${a[((k+j))]}" | tr -d -c "0-9" )
                        if (( x != y))
                        then
                            check=0
                            break
                        fi
                    done
                fi
                (( check == 1 )) && break
            done
            (( check == 0 )) && echo "unequal" || echo "superlist"
        else
            for (( j=0; j<len_B; j++ ))
            do 
                x=$( echo "${b[j]}" | tr -d -c "0-9" )
                y=$( echo "${a[0]}" | tr -d -c "0-9" )
                if (( x == y ))
                then
                    check=1
                    for (( k=0; k<len_A; k++ ))
                    do  
                        x=$( echo "${a[k]}" | tr -d -c "0-9" )
                        y=$( echo "${b[((k+j))]}" | tr -d -c "0-9" )
                        if (( x != y))
                        then
                            check=0
                            break
                        fi
                    done

                fi
                (( check == 1 )) && break
            done
            (( check == 0 )) && echo "unequal" || echo "sublist"
        fi
    fi
}

main "$@"