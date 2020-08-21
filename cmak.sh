#!/bin/bash

# How to call one shell script from another shell script?
# https://stackoverflow.com/questions/8352851/how-to-call-one-shell-script-from-another-shell-script
# https://www.codegrepper.com/code-examples/shell/script+inside+script+shell

. "$HOME/jdk14.sh"
bash "$HOME/Documents/_applications/cmak-3.0.0.5/bin/cmak" -Dconfig.file=/home/lisa/Documents/_applications/cmak-3.0.0.5/conf/application.conf -Dcmak.zkhosts="localhost:2181"

