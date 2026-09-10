# Sử dụng Tomcat 9 chạy trên Java 17
FROM tomcat:9.0-jdk17-openjdk-slim

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy file WAR vào Tomcat
COPY ch07cart.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

# Chạy Tomcat với cổng động từ Render
CMD ["sh", "-c", "sed -i 's/port=\"8080\"/port=\"'$PORT'\"/' /usr/local/tomcat/conf/server.xml && catalina.sh run"]
