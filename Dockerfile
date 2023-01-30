
#docker file for calculator

#build app
FROM maven:3.6.3-jdk-8-slim AS build
#creating dir path
RUN mkdir /cal
WORKDIR /cal
#cloning the code
COPY . /cal
RUN mvn package
                             
#deploying to tomcat

FROM tomcat:8.0 
COPY --from=build /cal/target/WebAppCal-1.3.5.war /usr/local/tomcat/webapps









