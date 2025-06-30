# Use a lightweight OpenJDK base image
FROM openjdk:17-jdk-slim

# Set working directory inside container
WORKDIR /app

# Copy the JAR file from target folder to container and rename it to app.jar
COPY target/clarity-timesheet-automation-1.0-SNAPSHOT.jar app.jar

# Expose port (if your app runs a server, like Spring Boot)
# EXPOSE 8080

# Run the JAR file
ENTRYPOINT ["java", "-jar", "app.jar"]
