#!/bin/bash
set -e

COLOR_END='\e[0m'
COLOR_RED='\e[0;31m'

# This current directory.
DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
ROOT_DIR=$(pwd)
EXTERNAL_ROLE_DIR="$ROOT_DIR/roles/galaxy"
ROLES_REQUIREMNTS_FILE="$ROOT_DIR/roles/requirements.yaml"

# Exit msg
msg_exit() {
    printf "$COLOR_RED$@$COLOR_END"
    printf "\n"
    printf "Exiting...\n"
    exit 1
}

# Trap if ansible-galaxy failed and warn user
cleanup() {
    msg_exit "Update failed. Please don't commit or push roles till you fix the issue"
}
trap "cleanup"  ERR INT TERM

# Check ansible-galaxy
[[ -z "$(which ansible-galaxy)" ]] && msg_exit "Ansible is not installed or not in your path."

# Check roles req file
[[ ! -f "$ROLES_REQUIREMNTS_FILE" ]]  && msg_exit "roles_requirements '$ROLES_REQUIREMNTS_FILE' does not exist or permssion issue.\nPlease check and rerun."

# Install roles
ansible-galaxy install -r "$ROLES_REQUIREMNTS_FILE" --force --no-deps -p "$EXTERNAL_ROLE_DIR"

exit 0