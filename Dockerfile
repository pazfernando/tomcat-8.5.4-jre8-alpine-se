FROM tomcat:8.0.36-jre8-alpine

COPY tomcat-users.xml /tmp/

USER root

RUN rm $CATALINA_HOME/conf/tomcat-users.xml \
  && mv /tmp/tomcat-users.xml $CATALINA_HOME/conf

CMD ["catalina.sh", "run"]
