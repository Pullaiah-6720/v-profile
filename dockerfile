FROM eclipse-temurin:17
WORKDIR /app
COPY . .
RUN apt update -y 
RUN apt install maven -y
RUN mvn clean package
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.120/bin/apache-tomcat-9.0.120.tar.gz .
RUN tar -xvf apache-tomcat-9.0.120.tar.gz
RUN cp -r target/*.war apache-tomcat-9.0.120/webapps/
CMD ["/app/apache-tomcat-9.0.120/bin/catalina.sh","run"]
