#!/bin/bash
main(){
    a="$1"
    len=${#a}
    rna=""
    for (( i=0; i<len; i++ ))
    do
        if ! [[ "${a:i:1}" = "A" || "${a:i:1}" = "T" || "${a:i:1}" = "C" || "${a:i:1}" = "G" ]]
then
            echo "Invalid nucleotide detected."
            exit 1
fi
        if [ "${a:i:1}" = "A" ]
        then
            rna+="U"
        elif [ "${a:i:1}" = "T" ]
        then
            rna+="A"
        elif [ "${a:i:1}" = "C" ]
        then
            rna+="G"
        elif [ "${a:i:1}" = "G" ]
        then
            rna+="C"
        fi
    done
    echo "$rna"
}

main "$@"