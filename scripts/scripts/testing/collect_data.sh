#!/bin/bash
set -e

if [ $1 != quick ] && [ $1 != update ]; then
    echo "Wrong execution mode ('quick' or 'update')."
    exit
fi

cd ~/git/covid-19-data
git pull

cd ~/git/covid-19-data/scripts/scripts/testing
python3 run_python_scripts.py $1
/usr/local/bin/Rscript run_r_scripts.R $1
