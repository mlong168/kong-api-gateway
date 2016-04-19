#!/bin/bash
# A quick & dirty backup script for Cassandra running inside Docker.
# Assumes /var/lib/cassandra is mounted in the container as /var/lib/cassandra because
# docker inspect {{ .Volumes }} is not shell-friendly. (doable, but meh)
# Also assumes Cassandra was started with 'docker run --name cassandra'.

export PATH=$PATH:/home/atobey/bin:/usr/local/bin

set -e

ks="ccfp"
bucket="kong-db-backup"
datadir="/var/lib/cassandra/data/${ks}"
name=$(date '+%m%d%y-%H:%M:%s')
tarball_file="/var/lib/cassandra/backups/${ks}-${name}.tar.gz"
ip=$(sudo docker inspect -f '{{ .NetworkSettings.IPAddress }}' cassandra)

nodetool --host $ip flush $ks
nodetool --host $ip snapshot $ks -t $name

sudo docker exec cassandra tar -czf $tarball_file $datadir/*/snapshots/$name

# assume /var/lib/cassandra is the volume in the container (for now)
if [ $? -eq 0 ] ; then
        aws put "${bucket}/${tarball_file}" $tarball_file
fi
