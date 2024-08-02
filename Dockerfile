FROM eclipse-temurin:17-jre-jammy
COPY build/libs/*.jar /app/runner.jar
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "/app/runner.jar"]
