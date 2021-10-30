# Variables to connect to our Postgres server
export PGUSER=postgres
export PGPASSWORD=postgres
export PGDATABASE=mylibrary_dev
export PGPORT=5432
# Hostname of our Postgres container
export PGHOST=localhost
# Port where the application is going to be deployed
export APPPORT=4001

source entrypoint.sh