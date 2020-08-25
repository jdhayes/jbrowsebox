BootStrap: library
From: ubuntu:18.04

%post
    # Update Ubuntu
    apt update -y

    # Install various softwares
    curl -sL https://deb.nodesource.com/setup_current.x | sudo -E bash -
    apt install -y build-essential zlib1g zlib1g-dev wget apache2 nodejs

    # Download JBrowse
    https://github.com/GMOD/jbrowse/releases/download/1.16.9-release/JBrowse-1.16.9.zip
    
    # Install JBrowse
    unzip chromonomer-1.11.tar.gz
    cd JBrowse-1.16.9
    ./setup
    npm run start

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

