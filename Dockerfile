# Use official Microsoft SQL Server image
FROM mcr.microsoft.com/mssql/server:2022-latest

# Set environment variables (set again via .env or docker-compose for flexibility)
ENV ACCEPT_EULA=Y
ENV MSSQL_PID=Developer

# Optional: copy initialization scripts
COPY init-db/ /init-db/

# Run SQL Server
CMD ["/opt/mssql/bin/sqlservr"]