FROM openjdk:8-jdk-alpine
MAINTAINER liuzhengyang.github.io
COPY target/springboot-demo-0.0.1-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","/app.jar"]