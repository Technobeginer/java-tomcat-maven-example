FROM tomcat:8.5.38-jre8
RUN rm -rf /usr/local/tomcat/webapps/*
COPY target/java-tomcat-maven-example.war /usr/local/tomcat/webapps/ROOT.war
EXPOSE 8080
CMD /usr/local/tomcat/bin/catalina.sh run