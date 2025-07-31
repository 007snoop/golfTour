FROM ubuntu:latest
LABEL authors="mean2"



# Use an OpenJDK base image
FROM openjdk:21-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the built jar file (you’ll name this later)
COPY target/golfTour-1.0-SNAPSHOT.jar app.jar

# Expose the default port
EXPOSE 8080

# Run the jar
ENTRYPOINT ["java", "-jar", "app.jar"]
