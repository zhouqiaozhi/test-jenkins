FROM eclipse-temurin:17-jre-jammy
COPY build/libs/*.jar /app/runner.jar
ENV JAVA_OPS="-Xms256m -Xmx256m"
EXPOSE 8080
ENTRYPOINT ["java", "${JAVA_OPS}", "-jar", "/app/runner.jar"]
