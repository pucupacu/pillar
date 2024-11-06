# Use official MySQL image from Docker Hub
FROM mysql:8.0.3

# Set environment variables for MySQL configuration
ENV MYSQL_ROOT_PASSWORD=rootpassword
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# Expose MySQL port
EXPOSE 3306

# Command to run MySQL server
CMD ["mysqld"]
