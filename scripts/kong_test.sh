#!/bin/sh

username="pizzahut"
password="pizzahut"
client_id="c652b1e804a941b9bddec72b88c019da"
client_secret="6d62c7e94f0f4ded938189f556201720"
provision_key="23516763ec0c4311c39c48c34c5a881d"
authenticated_userid="phi"
access_token=""
host="staging-s-sprint.pizzahut.com"
docker_host="127.0.0.1"

# Requesting the access token (setting the authenticated user ID to pizzahut):

curl -d "grant_type=password&username=$username&password=$password&scope=email&client_id=$client_id&client_secret=$client_secret&provision_key=$provision_key&authenticated_userid=$authenticated_userid" -H "Host: $host" https://$docker_host:8443/oauth2/token --insecure

# Consuming the API with the access token. Need to get access_token from output of command above and insert into access_token var. Then uncomment and run.

#curl -H "Host: $host" https://$docker_host:8443/get?access_token=$access_token --insecure
