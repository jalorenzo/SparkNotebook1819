FROM apache/zeppelin:0.8.0
WORKDIR /opt/
ADD  https://archive.apache.org/dist/spark/spark-1.6.1/spark-1.6.1-bin-hadoop2.6.tgz /opt/
RUN tar zxvf spark-1.6.1-bin-hadoop2.6.tgz
RUN chown -R root:root spark-1.6.1-bin-hadoop2.6
RUN ln -s spark-1.6.1-bin-hadoop2.6 spark

WORKDIR /zeppelin/
RUN pip install test_helper
RUN apt-get install -y netcat-openbsd
COPY ./conf/*.* /zeppelin/conf/
RUN chmod 755 /zeppelin/conf/zeppelin-env.sh

COPY docker_entrypoint.sh /usr/local/bin/
RUN ln -s /usr/local/bin/docker_entrypoint.sh /entrypoint.sh 
RUN chmod 755 /usr/local/bin/docker_entrypoint.sh
ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]

MAINTAINER Juan Angel Lorenzo <jlo@eisti.eu>

