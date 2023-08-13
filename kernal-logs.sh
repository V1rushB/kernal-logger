#!/bin/bash

set -e

  timeFormat=$(date +%Y-%m-%dT%H-%M)

  normalLogFile="kernal-logs-$timeFormat.txt"

  journalctl -k --since "1 hour ago" > "$normalLogFile"
  compressedLogFile="$normalLogFile.tar.bz2"

  tar -cvjf "$compressedLogFile" "kernal-logs-$timeFormat.txt"

  dbxcli put "$compressedLogFile" /kernal-logs-dbb/$compressedLogFile

  rm -rf $compressedLogFile $normalLogFile

