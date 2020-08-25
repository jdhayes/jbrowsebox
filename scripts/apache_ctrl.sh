#!/bin/bash -l

# Load Singularity
module load singularity

export HOME_DIR="$( dirname $(realpath $0) )/.."
export SINGULARITYENV_PORT=$(shuf -i8000-9999 -n1)
export SINGULARITY_BINDPATH=/bigdata,/bigdata/operations/opt/linux:/opt/linux,$SINGULARITY_BINDPATH
SCRIPT_NAME=$(basename $0)
export GROUP=users

if [[ $1 == 'start' ]]; then

    # Start Apache
    echo 'Starting Apache...'
    echo ${HOME_DIR}/config/httpd.conf
    singularity exec ${HOME_DIR}/images/chromonomer.sing apache2 -f ${HOME_DIR}/config/httpd.conf && echo 'Started'
    echo "Please configure your SSH tunnel and navigate to http://localhost:${SINGULARITYENV_PORT}/chromonomer/"

elif [[ $1 == 'stop' ]]; then

    # Stop Apache by killing PID
    if [[ -f ${HOME_DIR}/logs/httpd.pid ]]; then
        echo 'Stopping Apache...'
        kill $(cat ${HOME_DIR}/logs/httpd.pid) && echo 'Killed'
    else
        echo 'No PID file found at logs/httpd.pid'
    fi

else

    # Print usage
    echo -e "USAGE: ${SCRIPT_NAME} <start|stop>"

fi

