#!/bin/bash

# How to call one shell script from another shell script?
# https://stackoverflow.com/questions/8352851/how-to-call-one-shell-script-from-another-shell-script
# https://www.codegrepper.com/code-examples/shell/script+inside+script+shell

. "$HOME/jdk8.sh"
java -jar "$HOME/Documents/_applications/trifecta-bundle-0.18.13.bin.jar" --http-start

