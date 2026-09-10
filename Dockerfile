# Sử dụng Tomcat 9 chạy trên Java 17
FROM tomcat:9.0-jdk17-openjdk-slim

# Xóa ứng dụng mặc định của Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copy file Bai2.war ngay ở thư mục gốc vào Tomcat
COPY Bai2.war /usr/local/tomcat/webapps/ROOT.war

# Mở cổng 8080
EXPOSE 8080

CMD ["catalina.sh", "run"]
