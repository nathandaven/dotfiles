#!/bin/bash

# enable hidden files
shopt -s dotglob

# directory variables
SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)"
BACKUP_DIR="$HOME/.dotfiles.$(date +"%d-%m-%Y_%H.%M.%S")"
LINK_DIR="$HOME"

# colors
RED="\e[31m"
GREEN="\e[32m"
BOLDGREEN="\e[1;32m"
BOLDRED="\e[1;31m"
ENDCOLOR="\e[0m"

# linking function
symlink() {
    echo -e "$(printf "${GREEN} > Linking $1 to $LINK_DIR/$(basename $1)${ENDCOLOR}")"
    if [ "$DRY" == "false" ]; then
        ln -s -f "$1" "$LINK_DIR/$(basename $1)"
    fi
}

# backup function, renames existing files to .old if not already a link
backup() {
    if [[ (-f "$LINK_DIR/$(basename $1)" || -d "$LINK_DIR/$(basename $1)") && ! -L "$LINK_DIR/$(basename $1)" ]]; then
        echo -e "$(printf "${RED} * $LINK_DIR/$(basename $1) found, backing up to $BACKUP_DIR ${ENDCOLOR}")"
        if [ "$DRY" == "false" ]; then
            mv "$LINK_DIR/$(basename $1)" "$BACKUP_DIR/$(basename $1)"
        fi
    fi
}

parse() {
    for FILE in $1; do
        if [[ "$(basename $FILE)" != ".DS_Store" &&
        "$(basename $FILE)" != *.md &&
        "$(basename $FILE)" != *.sh &&
        "$(basename $FILE)" != *.vscode &&
        "$(basename $FILE)" != *.git &&
        "$(basename $FILE)" != configuration &&
        "$(basename $FILE)" != .config ]]; then
            backup "$FILE"
            symlink "$FILE"
        fi
    done
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

    # ~
    parse "$SCRIPT_DIR/*"

    # ~/.config
    SCRIPT_DIR="$SCRIPT_DIR/.config"
    BACKUP_DIR="$BACKUP_DIR/.config"
    LINK_DIR="$HOME/.config"
    parse "$SCRIPT_DIR/*"

    echo ""
    echo -e "$(printf "${BOLDGREEN}done! exiting${ENDCOLOR}")"
    echo ""
}

# entrypoint
main
