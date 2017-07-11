FROM centos:latest

MAINTAINER Clairton Rodrigo Heinzen <clairton.rodrigo@gmail.com>

RUN mkdir /opt/wildfly

RUN yum -y install java-1.8.0-openjdk-devel && yum clean all

ENV JBOSS_HOME /opt/wildfly

ENV JAVA_OPTS ''

ENV JAVA_HOME /usr/lib/jvm/java

ENV WILDFLY_VERSION 10.1.0.Final

RUN cd $JBOSS_HOME

RUN curl http://download.jboss.org/wildfly/$WILDFLY_VERSION/wildfly-$WILDFLY_VERSION.tar.gz -o $JBOSS_HOME/wildfly-$WILDFLY_VERSION.tar.gz

RUN tar xf $JBOSS_HOME/wildfly-$WILDFLY_VERSION.tar.gz -C $JBOSS_HOME

RUN mv $JBOSS_HOME/wildfly-$WILDFLY_VERSION/* $JBOSS_HOME

RUN rm -f $JBOSS_HOME/wildfly-$WILDFLY_VERSION.tar.gz

RUN rm -rf $JBOSS_HOME/wildfly-$WILDFLY_VERSION

RUN chmod 755 /opt/wildfly

RUN chmod +x /opt/wildfly/bin/standalone.sh

WORKDIR /opt/wildfly

EXPOSE 8080 8443

CMD ["/opt/wildfly/bin/standalone.sh", "-b", "0.0.0.0"]

