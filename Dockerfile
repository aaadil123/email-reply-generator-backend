FROM maven:3.8.5-eclipse-temurin-17

WORKDIR /app

# Copy everything
COPY . .

# Build and run in one step
RUN mvn clean package -DskipTests

EXPOSE 8080
CMD ["mvn", "spring-boot:run"]