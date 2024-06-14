#!/usr/bin/env bash

if [ -z "$ARGOCD_USERNAME" ] || [ -z "$ARGOCD_PASSWORD" ] || [ -z "$ARGOCD_DOMAIN" ] || [ -z "$ARGOCD_APPLICATION_NAME" ] || [ -z "$ARGOCD_TARGET_REVISION" ]; then
  echo "Error: ARGOCD_USERNAME, ARGOCD_PASSWORD, ARGOCD_DOMAIN, ARGOCD_APPLICATION_NAME, and ARGOCD_TARGET_REVISION must be set"
  exit 1
fi

echo "Logging into Argo CD..."
argocd login --username "$ARGOCD_USERNAME" --password "$ARGOCD_PASSWORD" --grpc-web "$ARGOCD_DOMAIN"

echo "Generating diff for $ARGOCD_APPLICATION_NAME at revision $ARGOCD_TARGET_REVISION..."
argocd app diff "$ARGOCD_APPLICATION_NAME" --revision "$ARGOCD_TARGET_REVISION" | npx diff2html-cli --style side --input stdin --file diff.html

if [ -n "$S3_BUCKET_NAME" ]; then
  if [ -n "$GITHUB_RUN_ID" ]; then
    PR_NUMBER=$(jq --raw-output .pull_request.number "$GITHUB_EVENT_PATH")
    JOB_ID=$GITHUB_RUN_ID
    S3_UPLOAD_PATH="${PR_NUMBER}/${JOB_ID}_diff.html"
  elif [ -n "$CI_JOB_ID" ]; then
    MR_ID=$(curl --header "PRIVATE-TOKEN: $CI_JOB_TOKEN" "$CI_API_V4_URL/projects/$CI_PROJECT_ID/merge_requests" | jq -r \
            ".[] | select(.source_branch==\"$CI_COMMIT_REF_NAME\") | .iid")
    PR_NUMBER=$MR_ID
    JOB_ID=$CI_JOB_ID
    S3_UPLOAD_PATH="${PR_NUMBER}/${JOB_ID}_diff.html"
  else
    echo "Neither GitHub nor GitLab environment detected."
    exit 1
  fi

  echo "Uploading diff.html to S3 bucket $S3_BUCKET_NAME at path $S3_UPLOAD_PATH..."
  aws s3 cp diff.html s3://"$S3_BUCKET_NAME"/"$S3_UPLOAD_PATH"
  S3_URL="https://$S3_BUCKET_NAME.s3.amazonaws.com/$S3_UPLOAD_PATH"
  echo "Diff result is available at: $S3_URL"
else
  echo "S3_BUCKET_NAME is not set. Skipping upload to S3."
fi
