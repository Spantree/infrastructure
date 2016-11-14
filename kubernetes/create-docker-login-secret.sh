# !/usr/bin/env bash

# Run `docker login` and then run this script below to populate a real
# docker-login.yml (as this should not be committed to source control)

tee "docker-login-secret.yaml" > /dev/null <<EOF
apiVersion: v1
kind: Secret
metadata:
  name: dockerhub
data:
  .dockerconfigjson: $(base64 -i ~/.docker/config.json)
type: kubernetes.io/dockerconfigjson
EOF
