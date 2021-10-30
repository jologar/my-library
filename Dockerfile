FROM elixir:latest

# Installing dependencies
RUN apt-get update && \
    apt-get install -y inotify-tools && \
    apt-get install -y postgresql-client

# Creating the app directory where the source code will be uploaded
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN ls -l /app

# Install hex package manager
RUN mix local.hex --force

# Compile the project
RUN mix do compile

# Execute the initialization script
CMD ["/app/entrypoint.sh"]