FROM ubuntu:16.04
WORKDIR app/
RUN apt-get update
RUN apt-get install -y wget
RUN apt-get install -y git
RUN apt-get install -y default-jdk
RUN apt-get install -y maven
RUN wget https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.88/bin/apache-tomcat-9.0.88.tar.gz
RUN tar -zxvf apache-tomcat-9.0.88.tar.gz
RUN  mv /app/apache-tomcat-9.0.88 /usr/share/
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /app/boxfuse-sample-java-war-hello/pom.xml package
RUN cp /app/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/share/apache-tomcat-9.0.88/webapps/
EXPOSE 8080
CMD ["/usr/share/apache-tomcat-9.0.88/bin/catalina.sh", "run"]
