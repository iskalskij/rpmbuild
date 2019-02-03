#!/bin/bash

mkdir -v rpm
mkdir -v packages
cd rpm
echo -e
#time wget -r -np -nd -A "*.rpm*" http://mirror.centos.org/centos/7/os/x86_64/Packages/ && echo OK || exit 1
time wget -r -np -nd -A "*.rpm*" ftp://centos.colocall.net/centos/7/os/x86_64/Packages/ && echo OK || exit 1

for file in *
do
rpmrebuild -d /mnt/vdb/packages --change-spec-preamble='sed -e "s/^Packager:.*/Packager:MySystem/" -e "s/^Vendor:.*/Vendor:MySystemLTD/"' -p -n $file
done

#createrepo packages/x86_64/
#yum install sendmail

exit 0
