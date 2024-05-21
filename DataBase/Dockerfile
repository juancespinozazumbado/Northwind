# Use an intermediate container to set permissions
# FROM alpine:latest AS intermediate
# WORKDIR /app
# COPY ./entrypoint.sh .
# RUN chmod +x entrypoint.sh

#  Final stage
# FROM mcr.microsoft.com/mssql/server:2019-latest


# FROM mcr.microsoft.com/mssql/server:2022-latest

# ENV SA_PASSWORD=OdiN.7072@
# ENV ACCEPT_EULA=Y

# COPY ./Northwind.bak /var/opt/mssql/data/
# COPY ./AdventureWorks2019.bak /var/opt/mssql/data/
# COPY --from=intermediate /app/entrypoint.sh /usr/src/app/entrypoint.sh

#  RUN /opt/mssql/bin/sqlservr --accept-eula & sleep 30 \
#     && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'OdiN.7072@' -Q 'RESTORE DATABASE Northwind FROM DISK = "/var/opt/mssql/data/Northwind.bak" WITH MOVE "Northwind" TO "/var/opt/mssql/data/Northwind.mdf", MOVE "Northwind_log" TO "/var/opt/mssql/data/Northwind_log.ldf"' \
#     && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'OdiN.7072@' -Q 'RESTORE DATABASE AdventureWorks2019 FROM DISK = "/var/opt/mssql/data/AdventureWorks2019.bak" WITH MOVE "AdventureWorks2019" TO "/var/opt/mssql/data/AdventureWorks2019.mdf", MOVE "AdventureWorks2019_log" TO "/var/opt/mssql/data/AdventureWorks2019_log.ldf"'




# ENTRYPOINT ["/usr/src/app/entrypoint.sh"]

FROM mcr.microsoft.com/mssql/server:2019-latest

ENV SA_PASSWORD=OdiN.7072@
ENV ACCEPT_EULA=Y

# Create a directory for the backups with appropriate permissions
RUN mkdir -p /tmp/mssql && chmod -R 777 /tmp/mssql

# Copy backup files and entrypoint script
COPY ./Northwind.bak /tmp/mssql/
COPY ./AdventureWorks2019.bak /tmp/mssql/
COPY ./entrypoint.sh /usr/src/app/entrypoint.sh

# # Add permission setting for the entrypoint script
# RUN ["chmod", "+x", "/usr/src/app/entrypoint.sh"]

ENTRYPOINT ["/usr/src/app/entrypoint.sh"]


