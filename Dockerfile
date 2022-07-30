FROM ubuntu:20.04
WORKDIR app/
RUN apt-get update
RUN apt-get install -y git
CMD [ "git" ]
RUN apt-get install -y openjdk-11-jdk
CMD ["java", "Main"]
RUN apt-get install -y maven
CMD ["mvn"]
RUN apt-get install -y tomcat9
EXPOSE 8080
CMD ["catalina.sh", "run"]
RUN git clone https://github.com/boxfuse/boxfuse-sample-java-war-hello.git
RUN mvn -f /app/boxfuse-sample-java-war-hello/pom.xml package
RUN cp /app/boxfuse-sample-java-war-hello/target/hello-1.0.war /usr/local/tomcat/webapps

