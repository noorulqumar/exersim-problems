#!/bin/bash
give_date() {
    formated_date=$1
    formated_day=$(date -d "$formated_date" +%A )
    day=$2
    count=$3
    if [[ $count =~ [0-9] ]]
    then
        chk=0

        while (( 1 ))
        do
            if [ "$formated_day" = "$day" ]
            then
                chk=$(( chk + 1 ))
                if (( chk == count ))
                then
                    echo "$formated_date" 
                    exit
                fi
                formated_date=$(date -d "$formated_date +1 day" -I ) 
                formated_day=$(date -d "$formated_date" +%A )
            else
                formated_date=$(date -d "$formated_date +1 day" -I ) 
                formated_day=$(date -d "$formated_date" +%A )
            fi
        done
    else
        month=$(date -d "$formated_date" +%B )
        formated_date=$(date -d "$formated_date +21 day" -I )
        formated_day=$(date -d "$formated_date" +%A )
        while (( 1 ))
        do
            if [ "$formated_day" = "$day" ]
            then
                date=$formated_date
            fi
            [ "$month" != "$( date -d "$formated_date +1day" +%B )" ] && break
            formated_date=$(date -d "$formated_date +1 day" -I ) 
            formated_day=$(date -d "$formated_date" +%A )
        done
        echo "$date"
        exit
    fi
}
main () {
    year=$1
    month=$2
    which=$3
    day=$4
    formated_date=$(date -d "$year-$month-1" -I )
    if [ "$which" = "teenth" ]
    then
        formated_date=$(date -d "$formated_date +12 day" -I )
        formated_day=$(date -d "$formated_date" +%A )
        for (( i=13; i<20; i++ ))
        do
            if [ "$formated_day" = "$day" ]
            then
                echo "$formated_date" 
            fi
            formated_date=$(date -d "$formated_date +1 day" -I ) 
            formated_day=$(date -d "$formated_date" +%A )
        done
    elif [ "$which" = "first" ]
    then
        give_date "$formated_date" "$day" $"1"
    elif [ "$which" = "second" ]
    then
        give_date "$formated_date" "$day" $"2"
    elif [ "$which" = "third" ]
    then
        give_date "$formated_date" "$day" $"3"
    elif [ "$which" = "fourth" ]
    then
        give_date "$formated_date" "$day" $"4"
    elif [ "$which" = "last" ]
    then
        give_date "$formated_date" "$day" "$which"
    fi
}
main "$@"