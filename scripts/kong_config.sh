#!/bin/sh

# Change this to 127.0.0.1 if running on linux

host="127.0.0.1"

# Creating the API:
curl -d "request_host=staging-s-sprint.pizzahut.com&upstream_url=http://services.midwest01.quikorder.com" $host:8001/apis

# Adding the OAuth 2.0 Plugin:

curl -d "name=oauth2&config.scopes=profile,email&config.enable_authorization_code=false&config.enable_password_grant=true" $host:8001/apis/staging-s-sprint.pizzahut.com/plugins/

# Creating a Consumer:

curl -d "username=pizzahut" $host:8001/consumers/

# Creating OAuth 2.0 credentials for the consumer:

curl -d "name=PHI-Staging&redirect_uri=https://pizzahut.com/" $host:8001/consumers/pizzahut/oauth2/
