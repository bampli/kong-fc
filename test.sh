#!/bin/sh

curl --request POST \
  --url 'http://localhost:80/api/bets' \
  --header 'apikey: Ij6TSWYlZi1iGmKCzSzVSyJT6feLveAN' \
  --header 'content-type: application/json' \
  --header 'host: bets-app.com.br' \
  --header 'user-agent: vscode-restclient' \
  --data '{"match": "1X-DC","email": "joe@doe.com","championship": "Uefa Champions League","awayTeamScore": "2"}' \
| jq