#!/bin/bash
main()
{
    number=$1
    square_root="$( echo "scale=0; sqrt($number)" | bc)"
    echo "$square_root"
}
main "$@"