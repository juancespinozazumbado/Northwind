#!/bin/bash

# Start SQL Server in the background
/opt/mssql/bin/sqlservr --accept-eula &

# Wait for SQL Server to start
echo "Waiting for SQL Server to start..."
sleep 30

# Restore the databases
echo "Restoring Northwind database..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'OdiN.7072@' -Q 'RESTORE DATABASE Northwind FROM DISK = "/tmp/mssql/Northwind.bak" WITH MOVE "Northwind" TO "/var/opt/mssql/data/Northwind.mdf", MOVE "Northwind_log" TO "/var/opt/mssql/data/Northwind_log.ldf"'

echo "Restoring AdventureWorks2019 database..."
/opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P 'OdiN.7072@' -Q 'RESTORE DATABASE AdventureWorks2019 FROM DISK = "/tmp/mssql/AdventureWorks2019.bak" WITH MOVE "AdventureWorks2019" TO "/var/opt/mssql/data/AdventureWorks2019.mdf", MOVE "AdventureWorks2019_log" TO "/var/opt/mssql/data/AdventureWorks2019_log.ldf"'

# Keep the container running
wait

