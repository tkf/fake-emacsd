#!/bin/sh

test -z "$1" &&
echo "usage: create.sh <HOME> [<TEMPLATE>]" &&
exit 1

HOME_BASE=$(dirname $(readlink -f $0))
TEMP_HOME=$HOME_BASE/$1

test -e "$TEMP_HOME" &&
echo "$TEMP_HOME already exists" &&
exit 2

TMPL_BASE=$HOME_BASE/templates
TMPL_CREATE=
TMPL_SH=$TMPL_BASE/default.sh
TMPL_EL=$TMPL_BASE/default.el

if test -n "$2"
then
    test "$2" = default &&
    echo "$2 isn't allowed as template name" &&
    exit 1
    
    test -e $TMPL_BASE/$2-create.sh && TMPL_CREATE=$TMPL_BASE/$2-create.sh
    test -e $TMPL_BASE/$2.sh &&        TMPL_SH=$TMPL_BASE/$2.sh
    test -e $TMPL_BASE/$2.el &&        TMPL_EL=$TMPL_BASE/$2.el
fi

echo "Creating emacsd"
echo "  HOME:                 $TEMP_HOME"
echo "  user-emacs-directory: $TEMP_HOME/.emacs.d"
echo "  user-init-file:       $TEMP_HOME/.emacs.d/init.el"
echo "  run script:           $TEMP_HOME/emacs.sh"
echo "from"
echo "  user-init-file:       $TMPL_EL"
echo "  run script:           $TMPL_SH"
test -n "$TMPL_CREATE" &&
echo "  using additional create script $TMPL_CREATE"

mkdir -p $TEMP_HOME/.emacs.d
cp $TMPL_EL $TEMP_HOME/.emacs.d/init.el
cp $TMPL_SH $TEMP_HOME/emacs.sh
chmod u+x $TEMP_HOME/emacs.sh

if test -n "$TMPL_CREATE"
then
    . $TMPL_CREATE
else
    true
fi
