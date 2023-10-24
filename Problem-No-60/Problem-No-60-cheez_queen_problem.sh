#!/bin/bash
main()
{
    white_queen=$1
    white_queen_postion=$2
    black_queen=$3
    black_queen_postion=$4
    

    if [ "${#white_queen_postion}" -eq "3" ]
    then
    white_queen_postion_in_x="${white_queen_postion:0:1}"
    white_queen_postion_in_y="${white_queen_postion:2:1}"
    else
        if [ "${white_queen_postion:0:1}" = "-" ]
        then 
            white_queen_postion_in_x+="${white_queen_postion:0:1}"
            white_queen_postion_in_x+="${white_queen_postion:1:1}"
            white_queen_postion_in_y="${white_queen_postion:3:1}"
        else
            white_queen_postion_in_x+="${white_queen_postion:0:1}"
            white_queen_postion_in_y+="${white_queen_postion:2:1}"
            white_queen_postion_in_y+="${white_queen_postion:3:1}"
        fi
    fi
    #echo "$white_queen_postion_in_x $white_queen_postion_in_y"

    if [ "${#black_queen_postion}" -eq "3" ]
    then
    black_queen_postion_in_x="${black_queen_postion:0:1}"
    black_queen_postion_in_y="${black_queen_postion:2:1}"
    else
        if [ "${white_queen_postion:0:1}" = "-" ]
        then 
            black_queen_postion_in_x+="${black_queen_postion:0:1}"
            black_queen_postion_in_x+="${black_queen_postion:1:1}"
            black_queen_postion_in_y="${black_queen_postion:3:1}"
        else
            black_queen_postion_in_x+="${black_queen_postion:0:1}"
            black_queen_postion_in_y+="${black_queen_postion:2:1}"
            black_queen_postion_in_y+="${black_queen_postion:3:1}"
        fi
    fi

    if ! (( white_queen_postion_in_x < 8 && black_queen_postion_in_x< 8 ))
    then
        echo "row not on board"
        exit 2
    elif ! (( white_queen_postion_in_y < 8 && black_queen_postion_in_y< 8 ))
    then
        echo "column not on board"
        exit 2
    elif (( white_queen_postion_in_y == black_queen_postion_in_y && white_queen_postion_in_x == black_queen_postion_in_x ))
    then
        echo "same position"
        exit 2
fi
    if (( white_queen_postion_in_x < 0  || black_queen_postion_in_x < 0 ))
    then
        echo "row not positive"
        exit 2
    fi
    if (( white_queen_postion_in_y < 0  || black_queen_postion_in_y < 0 ))
    then
        echo "column not positive"
        exit 2
    fi

    if (( white_queen_postion_in_x == black_queen_postion_in_x || white_queen_postion_in_y == black_queen_postion_in_y ))
    then
        echo "true"
    else
        check=1
        for (( proces=1; proces <=4; proces++ ))
        do
            if (( proces == 1 ))
            then
                j=$white_queen_postion_in_y;
                for (( i=white_queen_postion_in_x; i>=0; i-- ))
                do
                    if (( i == black_queen_postion_in_x && j == black_queen_postion_in_y ))
                    then
                        check=0
                        echo "true"
                        exit 0
                    fi
                    j=$(( j + 1 ))
                done
            elif (( proces == 2 ))
            then
                j=$white_queen_postion_in_y;
                for (( i=white_queen_postion_in_x; i>=0; i-- ))
                do
                    if (( i == black_queen_postion_in_x && j == black_queen_postion_in_y ))
                    then
                        check=0
                        echo "true"
                        exit 0
                    fi
                    if (( j == 0 ))
                    then
                        break
                    else
                    j=$(( j - 1 ))
                    fi
                done
            elif (( proces == 3 ))
            then
                j=$white_queen_postion_in_y;
                for (( i=white_queen_postion_in_x; i<8; i++ ))
                do
                    if (( i == black_queen_postion_in_x && j == black_queen_postion_in_y ))
                    then
                        check=0
                        echo "true"
                        exit 0
                    fi
                    if (( j < 8 ))
                    then
                        j=$(( j + 1 ))
                    else
                        break
                    fi
                done
                elif (( proces == 4 ))
            then
                j=$white_queen_postion_in_y;
                for (( i=white_queen_postion_in_x; i<8; i++ ))
                do
                    if (( i == black_queen_postion_in_x && j == black_queen_postion_in_y ))
                    then
                        check=0
                        echo "true"
                        exit 0
                    fi
                    if (( j == 0 ))
                    then
                        break
                    else
                        j=$(( j - 1 ))
                    fi
                done
            fi
        done
        if (( check == 1 ))
        then
            echo "false"
        else
            echo "true"
        fi
    fi
}
main "$@"