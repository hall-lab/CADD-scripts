#!/bin/bash

cd /build

# install anaconda
#curl -L -O https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh

#bash ./Miniconda2-latest-Linux-x86_64.sh -b -p /opt/conda
#export PATH=/opt/conda/bin:$PATH
#conda init
#echo "{}" > /.condarc
#chmod 0666 /.condarc


# install CADD
git clone https://github.com/hall-lab/CADD-scripts
cd CADD-scripts && git checkout -b dockerize origin/dockerize;

# These environment variables need to set in the install.sh script
# (This will do a "code" only installation of CADD)
# They should already be set inside the "install.sh" script of this
# particular github fork and branch
#
# ENV=true
# GRCh38v15=true
# GRCh37=false
# GRCh38=false
# ANNOTATIONS=false
# PRESCORE=false

bash ./install.sh

# Remember this VEP note

#\ This package installs only the variant effect predictor (VEP) library
#code. To install data libraries, you can use the 'vep_install' command
#installed along with it. For example, to install the VEP library for human
#GRCh38 to a directory
#
#vep_install -a cf -s homo_sapiens -y GRCh38 -c /output/path/to/GRCh38/vep --CONVERT
#
#(note that vep_install is renamed from INSTALL.pl
# to avoid having generic script names in the PATH)
#
#The --CONVERT flag is not required but improves lookup speeds during
#runs. See the VEP documentation for more details
#
#http://www.ensembl.org/info/docs/tools/vep/script/vep_cache.html
#
#done
##
## To activate this environment, use:
## > conda activate cadd-env-v1.5
##
## To deactivate an active environment, use:
## > conda deactivate
##

#root@33c085acd712:/build/CADD-scripts# which conda
#/opt/conda/bin/conda

conda clean --all

groupadd gsc
usermod -a -G gsc root

BASE_CADD=/opt/CADD-1-5
mkdir -p ${BASE_CADD}/{data,config,src}
chgrp -R gsc ${BASE_CADD}

cp -frv config ${BASE_CADD}
cp -frv data ${BASE_CADD}
cp -frv src ${BASE_CADD}
cp -frv CADD.sh ${BASE_CADD}

chmod -R 0777 ${BASE_CADD}/data
chmod -R 0777 ${BASE_CADD}/config
chmod -R 0777 ${BASE_CADD}/CADD.sh
chmod -R 0666 ${BASE_CADD}/config/*.cfg

touch ${BASE_CADD}/data/flag
chmod 0666 ${BASE_CADD}/data/flag

ls -al ${BASE_CADD}/data
ls -al ${BASE_CADD}/config

exit 0;
