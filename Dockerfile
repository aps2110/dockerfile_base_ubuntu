FROM ubuntu:20.04
WORKDIR app/
RUN apt-get update
RUN apt-get install -y openjdk-11-jdk
CMD ["java", "Main"]

RUN apt-get install -y maven
CMD ["mvn"]

RUN apt-get install -y tomcat9
EXPOSE 8080
CMD CMD ["catalina.sh" "run"]


