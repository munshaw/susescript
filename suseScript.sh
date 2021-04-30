#!/bin/bash

set -e

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
    sudo zypper install -t pattern devel_basis
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
esac
