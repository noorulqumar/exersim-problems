#!/bin/bash
main()
{
    plant="$1"
    seconds="$2"
    echo $plant
    echo $seconds
    years=0
    if [ "$plant" = "Earth" ]
    then
        mints=$(echo "scale=2; $seconds / 60" | bc)
        echo  "$mints" 

        hours=$(echo "scale=2; $mints / 60" | bc)
        echo  "$hours" 

        days=$(echo "scale=2; $hours / 24" | bc)
        echo  "$days" 

        Earth_years=$(echo "scale=2; $days / 365.25" | bc)
        Earth_years=$(echo "$Earth_years + 0.01" | bc)

        echo  "$Earth_years" 
    # elif [ "$plant" = "Mercury" ]
    # then
        # sec=$( echo " $seconds * 0.2408467" | bc )
        # echo $sec
        # mints=$(echo "scale=2; $seconds / 60" | bc)
        # echo  "$mints" 

        # hours=$(echo "scale=2; $mints / 60" | bc)
        # echo  "$hours" 

        # days=$(echo "scale=2; $hours / 24" | bc)
        # echo  "$days" 

        # years=$(echo "scale=2; $days / 0.2408467" | bc)
        # years=$(echo "$years + 0.01" | bc)

        # echo  "$years" 
    fi
    
}
main "$@"