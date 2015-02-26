FROM centos:centos7
MAINTAINER atyu30 ipostfix@gmail.com
RUN rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
RUN yum install epel-release -y
RUN yum --releasever=7 install nginx php-fpm php-mysql -y
EXPOSE 80
CMD [ "nginx", "-g", "daemon off;" ]
