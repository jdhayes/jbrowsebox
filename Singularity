BootStrap: library
From: ubuntu:18.04

%post
    # Update Ubuntu
    apt update -y

    # Install various softwares
    apt install -y build-essential zlib1g zlib1g-dev curl git libbio-featureio-perl
    curl -sL https://deb.nodesource.com/setup_14.x | bash -
    apt install -y nodejs

    # Download JBrowse
    curl -L -o JBrowse-1.16.9.tgz https://github.com/GMOD/jbrowse/archive/1.16.9-release.tar.gz
    
    # Install JBrowse
    tar -xf JBrowse-1.16.9.tgz
    mkdir -p /var/www/html/
    mv jbrowse-1.16.9-release /var/www/html/jbrowse
    cd /var/www/html/jbrowse
    npm install
    ./setup.sh

    # Set build date
    NOW=$(date)
    echo "export NOW=\"${NOW}\"" >> $SINGULARITY_ENVIRONMENT

%runscript
    # Print build date
    echo "Container was created $NOW"

    # Check name
    if [ "$SINGULARITY_NAME" = 'jbrowse' ]; then
        cmd=""
    else
        cmd=""
    fi

    # Parse args and re-insert quotes for final command
    for arg in "$@"; do
        echo $arg | grep -P '\s' >/dev/null
        ecode=$?
        if [ $ecode -eq 0 ]; then
            cmd="$cmd '$arg'"
        else
            cmd="$cmd $arg"
        fi
    done

    ${cmd}

