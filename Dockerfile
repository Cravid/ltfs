FROM centos:7

# Update packages
RUN yum -y update
RUN yum -y install fuse fuse-libs libicu lsscsi mt-st man-pages

COPY rhel7-qtmltfs-2.4.4.0-15.x86_64.rpm /tmp/rhel7-qtmltfs-2.4.4.0-15.x86_64.rpm
RUN rpm -i /tmp/rhel7-qtmltfs-2.4.4.0-15.x86_64.rpm

#COPY entrypoint.sh /entrypoint.sh
#ENTRYPOINT ["/entrypoint.sh"]
