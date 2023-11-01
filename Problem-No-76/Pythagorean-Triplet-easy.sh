#!/bin/bash
main()
{
    a=$1
    l=$(( a / 25 ))
    for (( i=1; i<=a/4 + l; i++ ))
    do
        for(( j=1; j<=a/2; j++ ))
        do
            (( c = $a-$i-$j ))
			(( $i*$i + $j*$j == $c*$c )) && echo "$i,$j,$c"
        done
    done
    exit 0
}
main "$@"