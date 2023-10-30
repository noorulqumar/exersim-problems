#!/bin/bash

main() {
    word="$1"
    rot="$2"
    string=""

    for ((i = 0; i < ${#word}; i++)); do
        char="${word:i:1}"
        ascii=$(printf "%d" "'$char")
        
        # Check if the character is a letter
        if [[ $char =~ [a-zA-Z] ]]; then
            if [[ $char == [[:lower:]] ]]; then
                # Handling lowercase letters
                ascii=$(( (ascii - 97 + rot) % 26 + 97 ))
            elif [[ $char == [[:upper:]] ]]; then
                # Handling uppercase letters
                ascii=$(( (ascii - 65 + rot) % 26 + 65 ))
            fi
            char=$(printf "\\$(printf %o "$ascii")")
        fi

        string+=$char
    done

    echo "$string"
}

main "$@"
