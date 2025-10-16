#!/bin/bash
URL="http://localhost:5000/status/200"
STATUS=$(curl -s -o /dev/null -w "%{http_code}" $URL)

if [ "$STATUS" -eq 200 ]; then
  echo "✅ Service healthy"
  exit 0
else
  echo "❌ Service unhealthy (status $STATUS)"
  exit 1
fi
