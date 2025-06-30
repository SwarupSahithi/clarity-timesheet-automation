# Use a lightweight Java runtime base image
FROM openjdk:17-jdk-slim

# Metadata
LABEL maintainer="your-name@example.com"
LABEL app="Clarity Timesheet Automation"

# Set the working directory in the container
WORKDIR /app

# Copy the JAR file into the image
COPY clarity-timesheet-automation-1.0-SNAPSHOT.jar app.jar

# Expose port if your app runs a server (optional)
# EXPOSE 8080

# Define the entry point to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
