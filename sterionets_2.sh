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
## Note that for plotting points the CENTRE is 0, not 90. So "000 80" is (geological convention) 000 10. 
echo 000 80 | psxy $prj $rgn -Sc0.25 -Gblue -K -O >> $outfile
psbasemap $prj $rgn -Bpa10f10g10 -Bsa0g2 -P -O >> $outfile

evince $outfile
