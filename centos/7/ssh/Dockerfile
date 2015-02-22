FROM centos:centos7
MAINTAINER Atyu30 <ipostfix@gmail.com>
RUN yum -y install openssh-server passwd sed
RUN echo "root:root" | chpasswd
RUN sshd-keygen
RUN sed -i "s/#UsePrivilegeSeparation.*/UsePrivilegeSeparation no/g" /etc/ssh/sshd_config && sed -i "s/UsePAM.*/UsePAM no/g" /etc/ssh/sshd_config
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]
