#!/bin/bash

############################################################
# SECRET ROTATION
############################################################

export VAULT_ADDR='http://127.0.0.1:8200'
export VAULT_TOKEN='root'

NEW_PASSWORD=$(openssl rand -base64 32)

vault kv put secret/postgres \
username="postgres" \
password="$NEW_PASSWORD"

echo ""
echo "PostgreSQL password rotated"
echo ""

############################################################
# OPTIONAL DATABASE UPDATE
############################################################

docker exec -it postgres_epi psql -U postgres \
-c "ALTER USER postgres WITH PASSWORD '$NEW_PASSWORD';"

echo "Database password updated"