#!/bin/sh

username=""
password=""
client_id=""
client_secret=""
provision_key=""
authenticated_userid=""
access_token=""
host=""
docker_host="127.0.0.1"

# Requesting the access token (setting the authenticated user ID to $username):

curl -d "grant_type=password&username=$username&password=$password&scope=email&client_id=$client_id&client_secret=$client_secret&provision_key=$provision_key&authenticated_userid=$authenticated_userid" -H "Host: $host" https://$docker_host:8443/oauth2/token --insecure

# Consuming the API with the access token. Need to get access_token from output of command above and insert into access_token var. Then uncomment and run.

#curl -H "Host: $host" https://$docker_host:8443/get?access_token=$access_token --insecure
