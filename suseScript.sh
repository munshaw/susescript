#!/bin/bash

set -e

function texlive {
    sudo zypper in -y texlive
}

function emacs {
    sudo zypper in -y ispell
    sudo zypper in -y emacs
    git clone -b develop https://github.com/syl20bnr/spacemacs ~/.emacs.d
    pushd ~/.emacs.d/private
    curl -L https://raw.githubusercontent.com/languagetool-org/languagetool/master/install.sh | bash
    popd
    cp .spacemacs ~
}

function updateEmacs {
    pushd ~/.emacs.d
    git pull
    popd
    echo "Now update your packages inside emacs!"
}

function node {
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash
    source ~/.bashrc
    nvm install node
}

function updateNode {
    nvm install node --reinstall-packages-from=node
    nvm install-latest-npm
}

function essential {
    sudo zypper in -y -t pattern devel_basis
}

function crypto {
    echo "To create new keys:"
    echo "Run: \`ssh-keygen -t ed25519 -C \"email@example.com\" \`"
    echo "Run: \`gpg --full-generate-key # 4k RSA\`"
    echo
    echo "To import keys:"
    echo "SSH Public: ~/.ssh/id_ed25519.pub"
    echo "SSH Private: ~/.ssh/id_ed25519"
    echo "GPG Public: \`gpg --import public.key\`"
    echo "GPG Private: \`gpg --import private.key\`"
    echo
    echo "To configure:"
    echo "Run: \` ssh-agent -s\`"
    echo "Run: \`ssh-add ~/.ssh/id_ed25519\`"
    echo "Run: \`gpg --list-keys\`"
    echo "Run: \`git config --global user.signingkey <Key code>\`."
    echo
    echo "To export GPG:"
    echo "Run: \`gpg --export --armor && gpg --export-secret-keys --armor\`"
}

function help {
    echo "crypto      Show crypto instructions"
    echo "essential   Install essentail development tools"
    echo "node        Install nodejs"
    echo "nodeUpdate  Update nodejs"
    echo "emacs       Install spacemacs"
    echo "updateEmacs Update spacemacs"
    echo "texlive     Install latex"
}

if [[ $# -eq 0 ]]
then
    help
fi

case $1 in
    crypto)
        crypto
        ;;
    essential)
        essential
        ;;
    node)
        node
        ;;
    updateNode)
        node
        ;;
    emacs)
        emacs
        ;;
    texlive)
        texlive
        ;;
    updateEmacs)
        updateEmacs
        ;;
esac
