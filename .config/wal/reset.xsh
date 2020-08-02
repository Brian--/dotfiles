#!/usr/bin/env xonsh
from emacs import Emacs
emacs = Emacs.client()

spicetify update
# spicetify restart

feh --bg-scale $(cat ~/.cache/wal/wal)

print('\nEmacs theme loaded:', emacs.eval("(load-theme 'ewal-spacemacs-modern)"))

./intellijPywal/intellijPywalGen.sh ~/.AndroidStudio3.6/config/
