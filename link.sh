#!/bin/bash

# enable hidden files
shopt -s dotglob

# directory variables
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BACKUP_DIR="$HOME/.dotfiles.$(date +"%d-%m-%Y_%H.%M.%S")"

# colors
RED="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;32m"
BOLDRED="\e[1;31m"
ENDCOLOR="\e[0m"

# linking function
symlink() {
    echo -e "$(printf "${GREEN} > Linking $1 to $HOME/$(basename $1)${ENDCOLOR}")"
    if [ "$DRY" == "false" ]; then
        ln -s -f "$1" "$HOME/$(basename $1)"
    fi
}

# backup function, renames existing files to .old if not already a link
backup() {
    if [[ (-f "$HOME/$(basename $1)" || -d "$HOME/$(basename $1)") && ! -L "$HOME/$(basename $1)" ]]; then
        echo -e "$(printf "${RED} * $HOME/$(basename $1) found, backing up to $BACKUP_DIR ${ENDCOLOR}")"
        if [ "$DRY" == "false" ]; then
            mv "$HOME/$(basename $1)" "$BACKUP_DIR/$(basename $1)"
        fi
    fi
}

# main
main() {
    DRY=false
    echo -e "$(printf "\n${BOLDGREEN}This script will backup your configurations to ${BOLDRED}${BACKUP_DIR}${BOLDGREEN} and sym link the dotfiles in this repo to your home directory.\n${ENDCOLOR}")"
    while true; do
        echo -e "$(printf "${BOLDRED}Continue?${ENDCOLOR}")"
        read -ep "(y/n/dry) " yn
        case $yn in
        y)
            mkdir "$BACKUP_DIR"
            break
            ;;
        dry)
            DRY=true
            echo -e "$(printf "${BOLDRED}Dry mode enabled, no fields will be modified${ENDCOLOR}")"
            break
            ;;
        *)
            echo exiting...
            exit
            ;;
        esac
    done

    echo ""
    for FILE in $SCRIPT_DIR/*; do
        if [[ "$(basename $FILE)" != ".DS_Store" && "$(basename $FILE)" != *.md && "$(basename $FILE)" != *.sh && "$(basename $FILE)" != *.vscode && "$(basename $FILE)" != *.git && "$(basename $FILE)" != configuration ]]; then
            backup "$FILE"
            symlink "$FILE"
        fi
    done

    echo ""
    echo -e "$(printf "${BOLDGREEN}done! exiting${ENDCOLOR}")"
    echo ""
}

# entrypoint
main
