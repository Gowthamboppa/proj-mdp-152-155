
#docker file for calculator

#build app
FROM maven:3.6.3-jdk-8-slim AS build
COPY src /home/app/src
COPY pom.xml /home/app
                             
RUN mvn -f /home/app/pom.xml clean test package
RUN ls home/app/target/

FROM adoptopenjdk/openjdk11 AS builder

COPY --from=build /home/app/target/WebAppCal-1.3.5.war /usr/WebAppCal-1.3.5.war

FROM tomcat:8.0 
COPY --from=builder /usr/WebAppCal-1.3.5.war /usr/local/tomcat/webapps









