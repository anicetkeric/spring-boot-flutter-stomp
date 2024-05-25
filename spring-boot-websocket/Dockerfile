FROM eclipse-temurin:17-jre-alpine
ADD target/spring-boot-websocket*.jar spring-boot-websocket.jar
EXPOSE 8089
ENTRYPOINT ["java","-jar","spring-boot-websocket.jar"]
