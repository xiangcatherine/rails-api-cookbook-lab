#!/bin/bash

API="${API_ORIGIN:-http://localhost:4741}"
URL_PATH="/ingredients"
curl "${API}${URL_PATH}/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --data '{
    "ingredient": {
      "name": "'"${NAME}"'",
      "unit": "'"${UNIT}"'"
    }
  }'

echo
