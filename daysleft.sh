#!/bin/bash

set -euxo pipefail

let X=(`date +%s -d 2038-01-19T03:14:07Z` - `date +%s`)/86400

Q="${X}+watch"

URL=$(curl --silent "https://www.googleapis.com/customsearch/v1?key=${GOOGLE_API_KEY}&cx=${SEARCH_ENGINE_ID}&q=${Q}" | tee result | jq -r .items[0].link)
cat result

echo -e "The world will end in ${X} days ${URL}" | curl -d@- ${FLAPPER_URL} | tee result
grep 'sent tweet' result
