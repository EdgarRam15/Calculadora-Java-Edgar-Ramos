# Etapa 1: Construcción del JAR usando Maven
FROM maven:3.9.4-eclipse-temurin-17 AS build

# Crear directorio dentro del contenedor
WORKDIR /app

# Copiar el archivo pom.xml y descargar dependencias
COPY pom.xml .
RUN mvn -B dependency:go-offline

# Copiar el restante del código
COPY src ./src

# Construir el JAR
RUN mvn -B package -DskipTests

# Etapa 2: Imagen final para ejecutar la aplicación
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copiar JAR generado en la etapa de build
COPY --from=build /app/target/*.jar app.jar

# Exponer el puerto (cambia el puerto si tu app usa otro)
EXPOSE 8080

# Comando para ejecutar la app
ENTRYPOINT ["java", "-jar", "app.jar"]
