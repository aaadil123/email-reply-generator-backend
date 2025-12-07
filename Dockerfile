FROM eclipse-temurin:17-jdk-alpine

WORKDIR /app

# If you have pre-built JAR
COPY target/*.jar app.jar

# Or if building from source (multi-stage)
# COPY --from=builder /app/target/*.jar app.jar

EXPOSE 8080
ENTRYPOINT ["java", "-jar", "app.jar"]