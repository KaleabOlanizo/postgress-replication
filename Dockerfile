FROM postgres:16

# Install pglogical
RUN apt-get update && \
    apt-get install -y postgresql-16-pglogical && \
    rm -rf /var/lib/apt/lists/*

# Enable pglogical
RUN echo "shared_preload_libraries = 'pglogical'" >> /usr/share/postgresql/postgresql.conf.sample

# Add the init script
COPY ./init-scripts /docker-entrypoint-initdb.d/
