# Используем официальный образ OpenJDK в качестве базового
FROM openjdk:21-jdk-slim

# Устанавливаем рабочий каталог
WORKDIR /app

# Копируем файл pom.xml и код проекта (включая зависимости)
COPY pom.xml .
COPY src ./src

# Собираем приложение с помощью Maven
RUN ./mvnw clean package -DskipTests

# Копируем финальный JAR файл
COPY target/*.jar app.jar

# Указываем, что приложение будет использовать 8080 порт
EXPOSE 8080

# Запускаем приложение
ENTRYPOINT ["java", "-jar", "/app/app.jar", "--server.port=8080"]

