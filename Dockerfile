FROM ubuntu:16.04
WORKDIR app/
RUN apt-get update
RUN apt-get install -y git
CMD [ "git" ]
RUN apt-get install -y openjdk-8-jdk
CMD ["jshell"]
RUN apt-get install -y maven
CMD ["mvn"]
RUN apt-get install -y tomcat7
EXPOSE 8080
CMD ["/usr/share/tomcat7/bin/catalina.sh", "run"]
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /app/boxfuse-sample-java-war-hello/pom.xml package
RUN cp /app/boxfuse-sample-java-war-hello/target/hello-1.0.war /var/lib/tomcat7/webapps

