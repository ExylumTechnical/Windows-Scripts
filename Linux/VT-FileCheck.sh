#!/bin/bash
hashes=$(cat hashes)
for HASH in $hashes;
do
echo $HASH
echo $HASH >> scanresults
curl --request GET --url https://www.virustotal.com/api/v3/files/$HASH --header 'x-apikey:<your API key>' | jq .data.attributes.last_analysis_results | grep category | sort | uniq -c >> scanresults
echo >> scanresults
done
