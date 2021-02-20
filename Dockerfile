# Adventure Works Database on SQL Server 2019
FROM mcr.microsoft.com/mssql/server:2019-CU5-ubuntu-18.04

# Note: This isn't a secure password, and please don't use this for production.
ENV SA_PASSWORD=ThisIsAReallyCoolPassword123
ENV ACCEPT_EULA=Y

# Change to root user to run wget and move the file
USER root

RUN wget -progress=bar:force -q -O AdventureWorks2019.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak \
    && wget -progress=bar:force -q -O AdventureWorksLT2019.bak https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorksLT2019.bak \
    && chmod 777 *.bak \
    && mkdir /var/opt/mssql/backup \
    && cp *.bak /var/opt/mssql/backup/

# Change back to the mssql user to restore the database
USER mssql

# Launch SQL Server, confirm startup is complete, restore the database, then terminate SQL Server.
RUN ( /opt/mssql/bin/sqlservr & ) | grep -q "Service Broker manager has started" \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${SA_PASSWORD} -Q 'RESTORE DATABASE AdventureWorks FROM DISK = "/var/opt/mssql/backup/AdventureWorks2019.bak" WITH MOVE "AdventureWorks2017" to "/var/opt/mssql/data/AdventureWorks.mdf", MOVE "AdventureWorks2017_Log" to "/var/opt/mssql/data/AdventureWorks_log.ldf", NOUNLOAD, STATS = 5' \
    && /opt/mssql-tools/bin/sqlcmd -S localhost -U SA -P ${SA_PASSWORD} -Q 'RESTORE DATABASE AdventureWorksLT FROM DISK = "/var/opt/mssql/backup/AdventureWorksLT2019.bak" WITH MOVE "AdventureWorksLT2012_Data" to "/var/opt/mssql/data/AdventureWorksLT.mdf", MOVE "AdventureWorksLT2012_Log" to "/var/opt/mssql/data/AdventureWorksLT_log.ldf", NOUNLOAD, STATS = 5' \
    && pkill sqlservr

CMD ["/opt/mssql/bin/sqlservr"]