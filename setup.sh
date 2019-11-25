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
    git clone git@github.com:BrittonBK/dots.git
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

function setup_git {
    read -p "Git e-mail: " gitemail
    read -p "Git name: " gitname
    git config --global diff.tool vimdiff
    git config --global merge.tool vimdiff
    git config --global user.email "${gitemail}"
    git config --global user.name "${gitname}"
}

function setup_vim {
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim +PluginInstall +qall
}

function setup_python {
    pyenv install 3.8.0
    pyenv install 2.7.14
    pyenv global 2.7.14
    pip install pipenv ipython[all] jupyter
}

function link_dots {
    ln -sf $DOTSDIR/.aliases ~/
    ln -sf $DOTSDIR/.tmux.conf ~/
    ln -sf $DOTSDIR/.vimrc ~/
    ln -sf $DOTSDIR/.zshrc ~/
    ln -sf $DOTSDIR/.zpreztorc ~/
}

function install_powerline_fonts {
    cd ${DEV_FOLDER}
    git clone https://github.com/powerline/fonts.git --depth=1
    cd fonts
    ./install.sh
    cd ..
    rm -rf fonts
}

function install_zsh {
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
    /usr/bin/env zsh -c 'setopt EXTENDED_GLOB\
        for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do \
            ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}" \
        done'

    chsh -s $(which zsh)
}

function modify_agnoster {
    agnoster_theme_file="$HOME/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme"
    sed -i '' "s/blue \$PRIMARY_FG ' %~ '/blue white ' %15ex<...<%~%<< '/" $HOME/.zprezto/modules/prompt/external/agnoster/agnoster.zsh-theme
    exec $SHELL
}

function zsh_and_prompt {
    printf "\n\n*** Setting up zsh and custom prompt ***\n\n"
    install_powerline_fonts
    install_zsh
    modify_agnoster
}

function personal_setup {
    cd ${DEV_FOLDER}
    git clone git@github.com:BrittonBK/dev_setup.git
    cd dev_setup
    ./setup.sh
}

function main {
    initial_dots_setup
    reqs_and_settings
    zsh_and_prompt
    setup_git
    setup_python
    setup_vim
    link_dots
    personal_setup
    echo "done"
}

main $@
