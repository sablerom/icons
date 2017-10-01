#!/bin/bash
set -e

if [ "$ENV" = 'DEV' ]; then
    echo "Running Development Server"
    exec python "icons.py"
else
    echp "Running Production Server"
    exec uwsgi --http 0.0.0.0:9090 --wsgi-file /app/icons.py \
         --callable app --stats 0.0.0.0:9191
fi