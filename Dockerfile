FROM ppc64le/centos8

ENV http_proxy http://9.196.156.29:3128
ENV https_proxy http://9.196.156.29:3128

# runtime support to enable npm build capabilities
#RUN yum -y install libstdc++ make gcc-c++ numactl-devel

# XLC runtime support - required by ibm_db node package
#RUN curl -sL http://public.dhe.ibm.com/software/server/POWER/Linux/xl-compiler/eval/ppc64le/rhel7/libm-xl-compiler-eval.repo 
# \
#        && yum -y install libxlc
        
#install most up-to-date LTS node for ppc64le
#RUN cd /usr/local \
#        && curl -sL https://nodejs.org/dist/v8.16.1/node-v8.16.1-linux-ppc64le.tar.xz > node-v8.16.1-linux-ppc64le.tar.xz \
#        && tar --strip-components 1 -xf node-v8.16.1-linux-ppc64le.tar.xz
        
# Add lpar2rrd user so we aren't running as root.
#RUN mkdir /data
#RUN adduser --home-dir /home/lpar2rrd -U lpar2rrd
#USER lpar2rrd

#COPY lpar2rrd-6.20.tar /home/lpar2rrd/lpar2rrd-6.20.tar
#WORKDIR /home/lpar2rrd
#RUN tar -xvf lpar2rrd-6.20.tar

#    && chown -R node-red:node-red /data \
#    && chown -R node-red:node-red /usr/src/node-red
#USER node-red
#WORKDIR /usr/src/node-red

# Db2 client support 
#RUN npm install ibm_db

# install local node-red
#RUN npm install --unsafe-perm node-red

#install Watson service nodes and dashdb clinet for Db2
#RUN npm install node-red-node-watson \
#        node-red-nodes-cf-sqldb-dashdb
        
# User configuration directory volume instead of ~/.node-red
#VOLUME ["/data"]

# default tcp port for node-red
#EXPOSE 1880

# Environment variable holding file path for flows configuration
#ENV FLOWS=flows.json

#CMD ["node", "./node_modules/node-red/red.js", "--userDir", "/data"]
CMD sleep 60000
