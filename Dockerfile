FROM ubuntu:20.04

RUN apt-get -y update && apt-get install -y default-jdk
CMD ["jshell"]

RUN apt-get install -y maven
CMD ["mvn"]

RUN apt-get install -y tomcat9
EXPOS 8080
CMD CMD ["catalina.sh" "run"]

WORKDIR app/
