#!/usr/bin/env bash

invalidDigits() {
	local base="$1"
	shift
	local digits=("$@")

	for digit in "${digits[@]}"; do
		if ((digit < 0 || digit >= base)); then
			return 0
		fi
	done

	return 1
}

toString() {
	local array=("$@")
	local result=""

	for value in "${array[@]}"; do
		result="$result$value"
	done

	echo "$result"
}

toDecimal() {
	local base="$1"
	shift
	local digits=("$@")
	local decimal=0
	local n=$((${#digits[@]} - 1))

	for digit in "${digits[@]}"; do
		decimal=$((decimal + digit * base ** n))
		n=$((n - 1))
	done

	echo "$decimal"
}

fromDecimal() {
	local base="$1"
	local n="$2"
	local result=""

	while ((n > 0)); do
		result="$((n % base)) $result"
		n=$((n / base))
	done

	if ((${#result} == 0)); then
		echo "0"
	else
		echo "${result::-1}"
	fi
}

from="$1"
IFS=' ' read -r -a digits <<<"$2"
to="$3"

if ((from <= 1 || to <= 1)); then
	echo "Invalid base"
	exit 1
elif invalidDigits "$from" "${digits[@]}"; then
	echo "Invalid digit"
	exit 1
elif ((to == 10)); then
	string="$(toDecimal "$from" "${digits[@]}")"
    array=()
	for ((i = 0; i < ${#string}; i++)); do
		char="${string:i:1}"
		array+=("$char")
	done
	echo "${array[@]}"
elif ((from == 10)); then
	fromDecimal "$to" "$(toString "${digits[@]}")"
else
	decimal="$(toDecimal "$from" "${digits[@]}")"
	fromDecimal "$to" "$decimal"
fi