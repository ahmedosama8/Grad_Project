FROM openjdk:19
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} gp.jar
CMD ["java","-jar","gp.jar"]
