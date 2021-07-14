#!/bin/bash
# coverage.sh -- check system for dotfile compatibility
# Copyright (C) 2021  Jacob Koziej <jacobkoziej@gmail.com>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
set -euo pipefail
IFS=$'\n\t'


PROGRAMS=(
)


MSG_FOUND="FOUND"
MSG_MISSING="MISSING"
COLOR_RED="\033[1;31m"
COLOR_GREEN="\033[1;32m"
FORMAT_BOLD="\033[1m"
FORMAT_NONE="\033[0m"


function program_check {
	printf "%bChecking installed programs:%b\n" \
		"${FORMAT_BOLD}"                    \
		"${FORMAT_NONE}"

	found=0
	missing=0

	for prog in "${PROGRAMS[@]}"; do
		if command -v "${prog}" &> /dev/null; then
			printf "%s %b\n" "${prog}" "${MSG_FOUND}"
			found=$((found + 1))
		else
			printf "%s %b\n" "${prog}" "${MSG_MISSING}"
			missing=$((missing + 1))
		fi
	done

	found="${FORMAT_BOLD}FOUND: ${COLOR_GREEN}${found}${FORMAT_NONE}"
	missing="${FORMAT_BOLD}MISSING: ${COLOR_RED}${missing}${FORMAT_NONE}"

	printf "%b %b\n" "${found}" "${missing}"
}


# enable color output when connected to a terminal
if test -t 1 ; then
	MSG_FOUND="${COLOR_GREEN}${MSG_FOUND}${FORMAT_NONE}"
	MSG_MISSING="${COLOR_RED}${MSG_MISSING}${FORMAT_NONE}"
fi


program_check
