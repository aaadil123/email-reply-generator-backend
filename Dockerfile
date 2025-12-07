FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# Copy everything
COPY . .

# Install Maven
RUN apk add --no-cache maven

# Build the JAR
RUN mvn clean package -DskipTests

# Run the JAR
EXPOSE 8080
ENTRYPOINT ["java", "-jar", "target/*.jar"]