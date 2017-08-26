#!/bin/bash

## strike, dip (following the right hand rule - thumb is the dip, heel of palm is the strike)
p1="179 26"
p2="100 45"
# equivalent to 100/45SW
p3="120 31"

# Lambert equal area
prj="-JA0/0/7i"
gmtset MAP_GRID_PEN_PRIMARY thick
rgn="-Rd"
file="net.ps"

psbasemap $prj $rgn -Bpa10f10g10 -Bsa0g2 -P -K > $file
# awk '{print 0, $1 "\n" $2, 0 "\n" $1+180}' $p1 | psxy $prj $rgn -W0.1,red -O >> $file
# echo $p1 | awk '{print 0, -90 "\n" 30,0 "\n" 0, 90}'  | psxy $prj $rgn -O -W1,red >> $file

echo $p1 | awk '{print 0, -90 "\n" 30,0 "\n" 0, 90}'  | psxy $prj $rgn -O -W1,red >> $file

# echo $p1 | awk '{print 0, -90 "\n" 30,0 "\n" 0, 90}'  | psxy $prj $rgn -O -W1,red >> $file

evince $file

# gmt psxy -R0/50/-50/50 -JX6i -Sv0.15i+bc+ea -Gyellow -W0.5p -Baf -P << EOF > map.ps
# 10 10 45 2i
# 30 -20 0 1.5i
# EOF
# evince map.ps
# rm map.ps
