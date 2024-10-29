function gssh() {
  local PROJECT_ID

  if [ "$1" = "prod" ]; then
    PROJECT_ID="sys9809430-32565-production"
  elif [ "$1" = "stage" ]; then
    PROJECT_ID="sys9809430-56874-staging"
  else
    echo "Not implemented."
    return 1
  fi

  if [ $(echo ${@:$#:1} = 'c') ]; then
    target=$(cat ~/.cache/gssh/data | grep -v 'NAME' | fzf | awk '{print $1}')
  else
    target=$(gcloud compute instances list --project="${PROJECT_ID}" | tee ~/.cache/gssh/data | grep -v 'NAME' | fzf | awk '{print $1}')
  fi
  gcloud compute ssh ${target} --project="${PROJECT_ID}" --tunnel-through-iap
}
