CREATE TABLE IF NOT EXISTS vault_audit (

    id SERIAL PRIMARY KEY,

    service TEXT,

    secret_name TEXT,

    access_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    status TEXT
);

INSERT INTO vault_audit(service, secret_name, status)
VALUES (
    'grafana',
    'postgres_credentials',
    'SUCCESS'
);