#!/bin/bash
main()
{
    Protein="$1"
    string=""
    for (( i=0; i<${#Protein}; i=$(( i + 3 ))))
    do
        temp=""
        for (( j=i; j<i+3; j++))
        do
            if [[ ${Protein:j:1} =~ [ACUG] ]]
            then    
                temp+=${Protein:j:1}
            else
                echo "Invalid codon"
                exit 1
            fi
        done
        if [ "$temp" = "AAA" ]
        then
            echo "Invalid codon"
            exit 1
        fi
        if [ "$temp" = "AUG" ]
        then
            [[ $string != "" ]] && string+=" Methionine" || string+="Methionine"
        elif [[ "$temp" = "UUU" || "$temp" = "UUC" ]]
        then
            [[ $string != "" ]] && string+=" Phenylalanine" || string+="Phenylalanine"
        elif [[ "$temp" = "UUA" || "$temp" = "UUG" ]]
        then
            [[ $string != "" ]] && string+=" Leucine" || string+="Leucine" 
        elif [[ "$temp" = "UCU" || "$temp" = "UCC" || "$temp" = "UCA" || "$temp" = "UCG" ]]
        then
            [[ $string != "" ]] && string+=" Serine" || string+="Serine" 
        elif [[ "$temp" = "UAU" || "$temp" = "UAC" ]]
        then
            [[ $string != "" ]] && string+=" Tyrosine" || string+=" Tyrosine"   
        elif [[ "$temp" = "UGU" || "$temp" = "UGC" ]]
        then
            [[ $string != "" ]] && string+=" Cysteine" || string+="Cysteine" 
        elif [[ "$temp" = "UGG" ]]
        then
            [[ -z $string ]] && string+="Tryptophan" || string+=" Tryptophan" 
        elif [[ "$temp" = "UAA" || "$temp" = "UAG" || "$temp" = "UGA"  ]]
        then
            echo $string
            exit
        fi
    done
    echo $string
}

main "$@"