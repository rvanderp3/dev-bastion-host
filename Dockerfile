FROM quay.io/centos/centos:centos8
RUN for repo in $(ls /etc/yum.repos.d/); do cat /etc/yum.repos.d/${repo} | sed s/#baseurl/baseurl/g | sed s/mirror\\./vault\\./g | tee /etc/yum.repos.d/${repo}; done
RUN dnf install -y squid

