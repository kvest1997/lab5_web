#!/bin/bash

gunicorn --bind 127.0.0.1:5000 wsgi:app & APP_PID=$!
sleep 5
echo "Starting client test"
python3 client.py
sleep 5
echo $APP_PID
kill -TERM $APP_PID
echo "Gunicorn process killed"
exit 0
