#!/bin/bash
result=$(npm audit --audit-level=moderate 2>&1)
rc=$?
if [ $rc -ne 0 ]; then
  summary=$(echo "$result" | tail -5 | sed 's/"/\\"/g' | tr '\n' ' ')
  echo "{\"systemMessage\": \"npm audit found vulnerabilities: ${summary}\"}"
fi
