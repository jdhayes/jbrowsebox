#!/bin/bash -l

# Load Singularity
module load singularity

export HOME_DIR="$( dirname $(realpath $0) )/.."
export SINGULARITYENV_PORT=$(shuf -i8000-9999 -n1)
export SINGULARITY_BINDPATH=/bigdata,/bigdata/operations/pkgadmin/opt/linux:/opt/linux,$SINGULARITY_BINDPATH
SCRIPT_NAME=$(basename $0)

# Change Port
#sed -i "s/^\"start.*-p 8082\",/\"start\": \"utils/jb_run.js -p $SINGULARITYENV_PORT\","

# Use default port for now
${HOME_DIR}/images/jbrowse cd /opt/miniconda2/envs/jbrowse/opt/jbrowse\; npm run start

