FROM centos:7
#FROM garland/butterfly

RUN yum -y install epel-release
RUN yum -y install python-pip
RUN yum -y install python-devel
RUN yum -y groupinstall 'development tools'
RUN curl 'https://setup.ius.io/' -o setup-ius.sh
RUN sh setup-ius.sh
RUN yum --enablerepo=ius info python36u -y
RUN yum --enablerepo=ius install python36u -y
RUN yum -y install python36u-pip
RUN pip3.6 install --upgrade pip
RUN pip3.6 install butterfly
WORKDIR /opt
RUN echo root:a | chpasswd
RUN git clone https://github.com/lanhel/pywumpus.git
#ENTRYPOINT ["butterfly.server.py"]
WORKDIR /opt/pywumpus
RUN echo "python3.6 /opt/pywumpus/pywumpus.py" >> /etc/profile
CMD ["butterfly.server.py", "--unsecure", "--host=0.0.0.0", "--cmd=python3.6 /opt/pywumpus/pywumpus.py"]
