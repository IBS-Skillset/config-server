#!/bin/bash
. ./common.sh
for (( i=1; i<=length; i++ )); do
  repo=${repoList[$i-1]}
  echo $repo
  declare "REPOSITORY_URI_source$i=$REPOSITORY_URI/$repo"
  if [ $TAG == $repo ]
  then
    repoUri="REPOSITORY_URI_source$i"
    docker pull ${!repoUri}:"$IMAGE_TAG"
  fi
done
