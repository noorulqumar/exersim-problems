#!/bin/bash
main()
{
    a="$1"
    b="$2"
    minimum_Panildrom_No=0
    maximum_Panildrom_No=0
    maximum_Panildrom_No_i=0
    maximum_Panildrom_No_j=0
    minimum_Panildrom_No_i=0
    minimum_Panildrom_No_j=0
    (( $# == 3 )) || exit 1
    if [[ $a != "smallest" ]] && [[ $1 != "largest" ]] 
    then
        echo "first arg should be 'smallest' or 'largest'"
        exit 1
    fi
    for (( i=a; i<=b; i++ ))
    do
        for (( j=a; j<=b; j++ ))
        do
        product=$(( i * j ))
        temp=$product
        reverse_number=0
        while [ $temp -gt 0 ]; do
            n=$(( temp % 10 ))
            reverse_number=$(( reverse_number * 10 + n ))
            temp=$(( temp / 10 ))
          
        done
        if (( product == reverse_number  )) 
        then 
            if (( minimum_Panildrom_No == 0 ))
            then
                minimum_Panildrom_No=$reverse_number
                minimum_Panildrom_No_i=$i
                minimum_Panildrom_No_j=$j
            else
                if (( maximum_Panildrom_No < reverse_number )) 
                then
                    maximum_Panildrom_No=$product 
                    maximum_Panildrom_No_i=$i 
                    maximum_Panildrom_No_j=$j
                fi
            fi
        fi

    done
done
echo  "The largest palindrome product is $minimum_Panildrom_No. Its factors are ($minimum_Panildrom_No_i, $minimum_Panildrom_No_j)"
echo  "The largest palindrome product is $maximum_Panildrom_No. Its factors are ($maximum_Panildrom_No_i, $maximum_Panildrom_No_j)"
}

main "$@"