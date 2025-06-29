# Use a lightweight OpenJDK image
FROM openjdk:17-jdk-slim

# Set working directory in container
WORKDIR /app

# Copy only the shaded JAR into the image
COPY target/clarity-timesheet-automation-1.0-SNAPSHOT-shaded.jar app.jar

# Run the JAR
ENTRYPOINT ["java", "-jar", "app.jar"]
