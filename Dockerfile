FROM elixir:latest

# Installing dependencies
RUN apt-get update && \
    apt-get install -y postgresql-client

# Creating the app directory where the source code will be uploaded
RUN mkdir /app
COPY . /app
WORKDIR /app

RUN ls -l /app

RUN mix --version

# Install hex package manager
RUN mix local.hex --force && \
    mix local.rebar --force
# Load only production dependencies
RUN mix deps.get --only-prod
# Compile the project
RUN MIX_ENV=prod mix do compile
# Deploy the static assets (js, css, ...)
RUN MIX_ENV=prod mix assets.deploy

# Execute the initialization script
CMD ["/app/entrypoint.sh"]