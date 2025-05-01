FROM postgres:16.3-bookworm

RUN apt-get update && \
    apt-get install -y postgresql-16-pglogical && \
    rm -rf /var/lib/apt/lists/*
