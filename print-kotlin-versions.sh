#!/bin/sh
if [ -n "$GITHUB_TOKEN" ]; then
curl --silent -g -X POST \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -d '{ "query": "{ repository(owner: \"JetBrains\", name: \"Kotlin\") { releases(first: 100) { nodes { tag { name } } } }}" }' \
    https://api.github.com/graphql \
    | jq -c '.data.repository.releases.nodes | map(.tag.name | select(test("^v\\d+\\.\\d+\\.\\d+$")) | gsub("v(?<version>.+)"; "\(.version)"))[:10]'
else
    echo '["1.8.0","1.7.22","1.7.21","1.7.20","1.7.10","1.7.0","1.6.21","1.6.20","1.6.10","1.5.32"]'
fi
