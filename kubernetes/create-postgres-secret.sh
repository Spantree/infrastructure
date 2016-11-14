# !/usr/bin/env bash

# Run `docker login` and then run this script below to populate a real
# docker-login.yml (as this should not be committed to source control)

set -o nounset

tee "postgres-secret.yaml" > /dev/null <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: $1-postgres
type: Opaque
data:
  db_password: $(printf "$2" | base64)
EOF
