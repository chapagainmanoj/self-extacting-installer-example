#!/bin/bash

function die() { echo "Error!"; exit 1; }

installer="$(pwd)/$(basename $BASH_SOURCE)"

cd ~/ || die
echo "Installing demo-app to ~/demo-app..."

archive=$(grep -a -n "__ARCHIVE_BELOW__:$" $installer | cut -f1 -d:)
echo $(tail -n +$((archive + 1)) $installer)

tail -n +$((archive + 1)) $installer | gzip -vdc - | tar -xvf - > /dev/null || die


# run some post installation if any
# ./app_name/bin/post_install_configuration.sh || die

echo "Installation complete!"
exit 0

__ARCHIVE_BELOW__: