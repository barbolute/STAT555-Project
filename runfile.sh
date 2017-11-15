# This script automates the use of the other scripts that compose of this project.
#


# curl -0
#


#Downloads the scripts needed to run this project.
curl -O https://raw.githubusercontent.com/barbolute/STAT555-Project/master/getdata.sh
curl -O https://raw.githubusercontent.com/barbolute/STAT555-Project/master/aligndata.sh


# Automates the acquisition of the data.
bash griffith-getdata.sh

# Aligns the data to both the short read and long read reference.
bash griffith-align.sh
