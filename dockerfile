# -- building --
FROM maven:3.9-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src/ .src/
RUN mvn clean package -DskipTests

# --runtime --
FROM tomcat:9.0-jdk17-temurin

COPY --from=build /app/target/*.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]
