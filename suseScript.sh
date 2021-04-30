#!/bin/bash

set -e

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
esac
