# ===== Stage 1: Build with Maven =====
FROM maven:3.9.6-eclipse-temurin-17 AS builder

WORKDIR /app

# Copy pom.xml và source code
COPY pom.xml .
COPY src ./src

# Build file WAR -> tạo ra /app/target/ch07cart.war
RUN mvn clean package -DskipTests

# ===== Stage 2: Run on Tomcat 9 =====
FROM tomcat:9.0-jdk17-temurin

# Xóa webapps mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy file WAR từ builder sang Tomcat, đổi tên thành ROOT.war
COPY --from=builder /app/target/ch07cart.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080 (chỉ mang tính tài liệu)
EXPOSE 8080

# Chạy Tomcat với cổng động từ biến môi trường PORT của Render
CMD ["sh", "-c", "sed -i 's/port=\"8080\"/port=\"'$PORT'\"/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
