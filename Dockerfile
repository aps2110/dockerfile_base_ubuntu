FROM ubuntu:20.04

RUN apt-get -y update && apt-get install -y default-jdk
CMD ["java", "Main"]

RUN apt-get install -y maven
CMD ["mvn"]

RUN apt-get install -y tomcat9
CMD CMD ["catalina.sh" "run"]

WORKDIR app/
