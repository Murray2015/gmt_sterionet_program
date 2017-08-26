#!/bin/bash

gmtset MAP_GRID_PEN_PRIMARY thick
outfile="net2.ps"
infile="fake_data.txt"
# Infile has the form "strike dip". the string "0 0 0 000 10 0 -1 6 0 0" is used to trick psmeca.
prj="-JA0/0/7i"
rgn="-Rd"

psmeca $prj $rgn -T1 -Sp6i -P -W2,red -K << EOF > $outfile
`awk '{print 0, 0, 0, $1, $2, 0, -1, 6, 0, 0}' $infile`
EOF
psbasemap $prj $rgn -Bpa10f10g10 -Bsa0g2 -P -O >> $outfile

evince $outfile
