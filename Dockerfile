# ---------- Stage 1: Build the JAR ----------
FROM maven:3.9.6-eclipse-temurin-8 AS builder

WORKDIR /build

# Copy the Maven project files
COPY . .

# Package the shaded JAR (skip tests if needed)
RUN mvn clean package -DskipTests

# ---------- Stage 2: Runtime ----------
FROM openjdk:8-jdk-slim

WORKDIR /app

# Copy only the built shaded JAR
COPY --from=builder /build/target/clarity-timesheet-automation-1.0-SNAPSHOT-shaded.jar app.jar

# If your automation needs ChromeDriver/Selenium headless, install them here
# Uncomment if needed:
# RUN apt-get update && apt-get install -y wget unzip xvfb libxi6 libgconf-2-4 \
#     && wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
#     && dpkg -i google-chrome*.deb || apt-get -fy install \
#     && rm google-chrome*.deb

# Default command to run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
