# Use the official PostgreSQL 16 image as the base
FROM postgres:16

# Copy the setup.sql script into the Docker image
COPY init.sql /docker-entrypoint-initdb.d/

# Set environment variables (optional)
ENV POSTGRES_DB=default_database
ENV POSTGRES_USER=root
ENV POSTGRES_PASSWORD=adminpass
