BootStrap: library
From: ubuntu:18.04

%post
    # Update Ubuntu
    apt update -y
    # Install various softwares
    apt install -y curl git

    # Install conda
    curl https://repo.anaconda.com/miniconda/Miniconda2-latest-Linux-x86_64.sh > ~/miniconda.sh
    bash ~/miniconda.sh -b -p /opt/miniconda2

    # Setup conda activation
    /opt/miniconda2/bin/conda shell.bash hook > /etc/profile.d/miniconda2.sh
    chmod 644 /etc/profile.d/miniconda2.sh
    . /etc/profile

    # Add appropriate channels
    #conda config --add channels defaults
    #conda config --add channels bioconda
    #conda config --add channels conda-forge

    # Create environment
    conda create -n jbrowse
    conda activate jbrowse
    conda install -n jbrowse -c bioconda jbrowse
    conda install -n jbrowse -c conda-forge nodejs
    cd /opt/miniconda2/envs/jbrowse/opt/
    mv jbrowse jbrowse_broken
    git clone https://github.com/gmod/jbrowse
    cd jbrowse
    git checkout 1.16.9-release
    ./setup.sh
    #npm run start
    
    # Set build date
    NOW=$(date)
    echo "export NOW=\"${NOW}\"" >> $SINGULARITY_ENVIRONMENT

%runscript
# Print build date
echo "Container was created $NOW"

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

# Run script as bash
/bin/bash << EOF
# Load miniconda2
source /etc/profile.d/miniconda2.sh

# Activate jbrowse conda environment
conda activate jbrowse

# Run command
${cmd}
EOF
