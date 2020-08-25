#!/bin/bash -l 

# Load Singularity
module load singularity

# Set home dir location
HOME_DIR="$( dirname $(realpath $0) )/.."
cd ${HOME_DIR}

# Create output dir
mkdir 20150603

# Run chromonomer
chromonomer -p ~/research/20150603_linkage_map.tsv \
    -o ~/research/20150603/ -s ~/research/markers.sam \
    -a ~/research/final.assembly.agp --data_version 20150603

# Set data mount point
export SINGULARITY_BINDPATH=${HOME_DIR}/20150603:/usr/local/share/chromonomer/php/20150603

# Start Apache
./apache_ctrl.sh start

# Visualize with local browser via SSH tunnel

# Stop Apache
./apache_ctrl.sh stop

