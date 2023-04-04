#!/bin/sh -l

if [ $2 ] ; then
  # token provided use with
  export RAILWAY_TOKEN=$2
fi

detach=""
if [ $3 ] ; then
  detach="--detach"
fi

railwayCmd = "railway up --service $1 "${detach}" --json"
eval $railwayCmd || error_code=$?

echo "here"
echo $error_code

if [ "${error_code}" -ne 0 ]; then
    exit $error_code
else
    echo "status=Success" >> $GITHUB_OUTPUT
fi