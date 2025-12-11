#!/bin/sh

if [ -f /app/tmp/pids/server.pid ]; then
  rm /app/tmp/pids/server.pid
fi

# Clean up overmind socket if it exists
if [ -S /tmp/overmind.sock ]; then
  rm /tmp/overmind.sock
fi

bin/dev
