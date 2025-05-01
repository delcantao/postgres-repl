ALTER SYSTEM SET wal_level = 'logical';
ALTER SYSTEM SET max_worker_processes = 10;
ALTER SYSTEM SET max_replication_slots = 10;
ALTER SYSTEM SET max_wal_senders = 10;
ALTER SYSTEM SET shared_preload_libraries = 'pglogical';

CREATE ROLE replicador WITH LOGIN PASSWORD 'senha_forte';
GRANT pg_read_all_data TO replicador;
GRANT pg_write_all_data TO replicador;
GRANT USAGE ON SCHEMA public TO replicador;
ALTER ROLE replicador REPLICATION;

GRANT SELECT ON ALL TABLES IN SCHEMA public TO replicador;
GRANT INSERT ON ALL TABLES IN SCHEMA public TO replicador;
GRANT DELETE ON ALL TABLES IN SCHEMA public TO replicador;
GRANT UPDATE ON ALL TABLES IN SCHEMA public TO replicador;

-- SELECT pglogical.create_node(
--   node_name := 'nodo_a',
--   dsn := 'host=54.37.255.7 port=9898 dbname=mydatabase user=replicador password=senha_forte'
-- );
