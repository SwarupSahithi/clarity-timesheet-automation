# Use a lightweight Java runtime base image
FROM openjdk:17-jdk-slim

# Set the working directory in the container
WORKDIR /app

# Copy your compiled JAR from target folder to the container, rename as app.jar
COPY target/clarity-timesheet-automation-1.0-SNAPSHOT.jar app.jar

# Command to run your JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
