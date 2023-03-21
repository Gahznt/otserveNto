#!/bin/bash
while true; do
  ./theotxcombat > data/logs/output.log &
  PID=$!
  echo $PID > theotxcombat.pid
  wait $PID
  sleep 5
done