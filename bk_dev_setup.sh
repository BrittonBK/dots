#!/bin/bash
DEV_FOLDER=~/dev
DOTSDIR=${DEV_FOLDER}/dots
BASE_URL="https://github.com/brittonbk/dots"
RAW_BASE_URL="https://raw.githubusercontent.com/brittonbk/dots/master"
BREW_FILE_URL="${RAW_BASE_URL}/brew.txt"
BREW_CASK_FILE_URL="${RAW_BASE_URL}/brew-cask.txt"

function initial_dots_setup {
    mkdir ~/$DEV_FOLDER
    cd ~/DEV_FOLDER
    git status
    read -n1 -r -p "Press any key to continue once dev tools are installed..." key
    git clone https://github.com/BrittonBK/dots.git
}

function reqs_and_settings {
    # Brew Installs
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    curl -o /tmp/brew.txt ${BREW_FILE_URL}
    curl -o /tmp/brew-cask.txt ${BREW_CASK_FILE_URL}
    brew install `cat /tmp/brew.txt | sed ':a;N;$!ba;s/\n/ /g'`
    brew cask install `cat /tmp/brew-cask.txt | sed ':a;N;$!ba;s/\n/ /g'`

    # System Settings
    defaults write -g InitialKeyRepeat -int 12
    defaults write -g KeyRepeat -int 1
}

function install_zsh {
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    /usr/bin/env zsh -c 'setopt EXTENDED_GLOB\
        for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do \
            ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" \
        done'

    chsh -s $(which zsh)
}

function setup_git {
    read -p "Git e-mail: " gitemail
    read -p "Git name: " gitname
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global user.email "${gitemail}"
    git config --global user.name "${gitname}"
}

function main {
    echo "Main Function"
    # initial_dots_setup
    # reqs_and_settings
    # install_zsh
    # setup_git
}

main $@
