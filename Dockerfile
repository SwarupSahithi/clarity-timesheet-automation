FROM openjdk:17-jdk-slim

WORKDIR /app

COPY target/clarity-timesheet-automation-1.0-SNAPSHOT-shaded.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
