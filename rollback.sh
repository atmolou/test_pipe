#!/bin/bash
echo "🚨 Rolling back to previous version..."
docker stop webapp
docker rm webapp
docker run -d --name webapp -p 5000:5000 kennethreitz/httpbin
echo "✅ Rollback complete."
