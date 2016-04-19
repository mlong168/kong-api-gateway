#!/bin/bash
# A quick & dirty backup script for Cassandra running inside Docker.
# Assumes /var/lib/cassandra is mounted in the container as /var/lib/cassandra because
# docker inspect {{ .Volumes }} is not shell-friendly. (doable, but meh)
# Also assumes Cassandra was started with 'docker run --name cassandra-data'.

export PATH=$PATH:~/bin:/usr/local/bin

set -e

ks="kong"
bucket="s3://kong-db-backup"
datadir="/var/lib/cassandra/data/${ks}"
name=$(date '+%m%d%y-%H:%M')
tarball_file="/backup/${ks}-${name}.tar.gz"
tarball_name="${ks}-${name}.tar.gz"
ip=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' cassandra)

docker exec cassandra nodetool flush $ks
docker exec cassandra nodetool snapshot $ks -t $name
docker run --rm --volumes-from cassandra-data -v $(pwd):/backup mini/base sh -c "tar -czf $tarball_file $datadir/*/snapshots/$name"

# assume /var/lib/cassandra is the volume in the container (for now)
if [ $? -eq 0 ] ; then
        aws s3 cp $tarball_name "${bucket}/${tarball_name}"
fi
