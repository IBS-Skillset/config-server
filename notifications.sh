#!/bin/bash
. ./common.sh
SLACK_CHANNEL=skillset
for (( i=1; i<=length; i++ )); do
  repo=${repoList[$i-1]}
  echo $repo
  repoPath="CODEBUILD_SRC_DIR_source$i"
  if [ $TAG == $repo ]
  then
    cd ${!repoPath}
    status=$(kubectl apply -f deploy/deployment.yaml)
    echo $status
    kubectl apply -f deploy/service.yaml
    APP_WITH_VERSION=$REPOSITORY_URI/$repo:$IMAGE_TAG
    send_notification() {
      if [[ "$status" == *"configured"* || "$status" == *"unchanged"* || "$status" == *"created"* ]]; then
        echo "It's there."
      else
        echo "It's not there."
      fi
      local message="payload={\"channel\": \"#$SLACK_CHANNEL\",\"attachments\":[{\"pretext\":\"$1\",\"text\":\"$2\"}]}"

      curl -X POST --data-urlencode "$message" "$WEBHOOK_URL"
    }

    send_notification "*[AWS][DEPLOYMENT]*" "Deployed application *$APP_WITH_VERSION*"
  fi
done
