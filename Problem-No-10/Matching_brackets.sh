#!/bin/bash

true_ () {
    echo "true"
    exit
}

false_() {
    echo "false"
    exit
}

main () {

    reduced=$(echo "${1}" | tr -c -d '{[()]}')
    if [[ -z ${reduced} ]]; then
        true_        
    elif (( ${#reduced} % 2 == 1 )); then
        false_
    fi

    while new_reduced=$(echo "${reduced}" | sed 's/{}//g;s/()//g;s/\[\]//g' ); do
        if [[ -z ${new_reduced} ]]; then
            true_
        elif [[ "${new_reduced}" != "${reduced}" ]]; then
            reduced="${new_reduced}"
        else
            false_
        fi
    done
}

main "$@"