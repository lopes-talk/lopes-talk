# Use the official OpenJDK image as the base image
FROM openjdk:17-jdk-slim

# Set the working directory
WORKDIR /app

# Copy the JAR file to the working directory
COPY target/api-0.0.1-SNAPSHOT.jar /app/app.jar

# Set required environment variables
ENV SPRING_DATA_MONGODB_URI=mongodb+srv://lopers:Jump0verL1mits@cluster0.ow0ubdy.mongodb.net/lopesTalkData

# Expose the port the app runs on
EXPOSE 8080

# Start the application
ENTRYPOINT ["java", "-jar", "app.jar"]
