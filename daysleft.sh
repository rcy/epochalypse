#!/bin/bash

let X=(`date +%s -d 2038-01-19T03:14:07Z` - `date +%s`)/86400

echo The world will end in $X days. | curl $FLAPPER_URL -d@-
