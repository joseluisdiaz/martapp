FROM library/postgres

EXPOSE 5432

COPY 01_Database_CREATE_ALL.sql /docker-entrypoint-initdb.d/
COPY 02_Adding_some_data.sql /docker-entrypoint-initdb.d/


# to build `docker build -t my_db .`
# to run it `docker run -e POSTGRES_PASSWORD=password -e POSTGRES_DB=marta -p 5432:5432 my_db`
