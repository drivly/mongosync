FROM ubuntu:20.04

RUN apt-get update; apt install -y curl wget tar sudo
RUN curl -L https://fastdl.mongodb.org/tools/mongosync/mongosync-ubuntu2004-x86_64-1.1.0.tgz -o mongosync-ubuntu2004-x86_64-1.1.0.tgz
RUN tar -zxvf mongosync-ubuntu2004-x86_64-1.1.0.tgz
RUN sudo cp mongosync-ubuntu2004-x86_64-1.1.0/bin/mongosync /usr/local/bin/
RUN chmod +x /usr/local/bin/mongosync

CMD mongosync --cluster0 $MONGO_SOURCE_URI --cluster1 $MONGO_LOCAL_URL
