#!/bin/bash

#yum install -y wget epel-release
#yum install -y rpmrebuild

#mkdir -v /mnt/sdb/build/rpm
#mkdir -v /mnt/sdb/build/packages
cd /var/lib/jenkins/rpm

echo -e
#time wget -r -np -nd -A "*.rpm*" http://mirror.centos.org/centos/7/os/x86_64/Packages/ && echo OK || exit 1
#time wget -r -np -nd -A "*.rpm*" ftp://centos.colocall.net/centos/7/os/x86_64/Packages/ && echo OK || exit 1

for file in *
do
rpmrebuild -d /var/lib/jenkins/packages --change-spec-preamble='sed -e "s/^Packager:.*/Packager:MySystem/" -e "s/^Vendor:.*/Vendor:MySystemLTD/"' $file
done

#rm -rf *
#createrepo packages/x86_64/
#yum install sendmail

exit 0

