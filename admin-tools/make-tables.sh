#!/bin/bash
bs=${BASH_SOURCE[0]}
mydir=$(dirname $bs)
PYTHON=${PYTHON:-python}

cd $mydir/../mathicsscript/data
mathics3-generate-json-table --field=ascii-operators -o mma-tables.json

for file in inputrc-unicode inputrc-no-unicode; do
    echo "# GNU Readline input unicode translations" > $file
    echo "# Autogenerated from mathics_scanner.generate.rl_inputrc on $(date)" >> $file
    echo "" >> $file
    $PYTHON -m mathics_scanner.generate.rl_inputrc inputrc-unicode >> $file
done
