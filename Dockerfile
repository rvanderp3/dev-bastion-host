FROM quay.io/centos/centos:stream8
RUN for repo in $(ls /etc/yum.repos.d/); do cat /etc/yum.repos.d/${repo} | sed s/#baseurl/baseurl/g | sed s/mirror\\./vault\\./g | sed s/enabled=0/enabled=1/g | tee /etc/yum.repos.d/${repo}; done
RUN dnf install -y squid

