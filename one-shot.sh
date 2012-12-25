#!/bin/sh

test "$1" = "-h" -o "$1" = "--help" &&
echo "usage: [TEMPLATE=<TEMPLATE>] $0 [arguments to emacs.sh]" &&
exit 0

HOME_BASE=$(dirname $(readlink -f $0))
TEMP_HOME=`mktemp --directory --dry-run --tmpdir=${HOME_BASE} tmp.XXXXXXXXXX`
if test -z "$TEMP_HOME"
then
    echo "Failed to create temporary directory."
    exit 1
fi

trap "rm -rf $TEMP_HOME" EXIT

$HOME_BASE/create-emacsd.sh $(basename $TEMP_HOME) $TEMPLATE
$TEMP_HOME/emacs.sh "$@"
