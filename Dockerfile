FROM tomcat:8.0.36-jre8-alpine

ENV JAVA_OPTS "$JAVA_OPTS -Djava.awt.headless=true"

COPY tomcat-users.xml /tmp/
COPY web.xml /tmp/

USER root

RUN rm $CATALINA_HOME/conf/tomcat-users.xml \
  && echo $JAVA_OPTS \
  && mv /tmp/tomcat-users.xml $CATALINA_HOME/conf \
  && rm $CATALINA_HOME/webapps/manager/WEB-INF/web.xml \
  && mv /tmp/web.xml $CATALINA_HOME/webapps/manager/WEB-INF

CMD ["catalina.sh", "run"]
