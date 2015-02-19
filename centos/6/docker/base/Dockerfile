#Dockerfile
FROM blalor/centos
MAINTAINER atyu30
RUN ssh-keygen -q -N "" -t dsa -f /etc/ssh/ssh_host_dsa_key && \
    ssh-keygen -q -N "" -t rsa -f /etc/ssh/ssh_host_rsa_key
EXPOSE 22
RUN echo 'root:123456' | chpasswd
ENV LANG en_US.UTF-8
ENV LC_ALL en_US.UTF-8
CMD /usr/sbin/sshd -D
#End

