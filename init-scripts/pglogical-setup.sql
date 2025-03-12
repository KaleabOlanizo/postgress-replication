-- Enable pglogical extension
CREATE EXTENSION IF NOT EXISTS pglogical;

-- Create the pglogical node
SELECT pglogical.create_node(
    node_name := 'node1',
    dsn := 'host=${POSTGRES_HOST} dbname=${POSTGRES_DB} user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'
);

-- Create replication set and add all tables
SELECT pglogical.create_replication_set('default');
SELECT pglogical.replication_set_add_all_tables('default', 'public');

SELECT pglogical.create_subscription(
    subscription_name := 'sub1',
    provider_dsn := 'host=${PRIMARY_DB_HOST} dbname=${POSTGRES_DB} user=${POSTGRES_USER} password=${POSTGRES_PASSWORD}'
);
