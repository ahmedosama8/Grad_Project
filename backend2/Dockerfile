FROM openjdk:19
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} gp.jar
COPY ./data/diagnoses.xlsx .
ENV excel.path=./diagnoses.xlsx
CMD ["java","-jar","gp.jar"]
