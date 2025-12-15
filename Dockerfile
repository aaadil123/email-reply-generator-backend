# Build stage
FROM maven:3.8.5-eclipse-temurin-17 AS build

WORKDIR /app

# Copy Maven files
COPY pom.xml .
RUN mvn dependency:go-offline -B

# Copy source code
COPY src ./src

# Build the application
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:17-jre-alpine

WORKDIR /app

# Copy the JAR from builder stage
COPY --from=build /app/target/email-reply-generator-0.0.1-SNAPSHOT.jar app.jar

# Render uses PORT environment variable
ENV PORT=8080
EXPOSE $PORT

# Run the application
CMD ["sh", "-c", "java -jar -Dserver.port=${PORT} app.jar", "/app/email-reply-generator-0.0.1-SNAPSHOT.jar"]