#!/bin/sh
  if [ "$2" = "" ]; then
      git archive --format=zip --prefix=archive/ HEAD `git diff --name-only --diff-filter=ACMR $1 HEAD` -o archive.zip
      git diff --stat --name-status --diff-filter=D $1 HEAD > deleted_files.txt
  else
      git archive --format=zip --prefix=archive/ $1 `git diff --name-only --diff-filter=ACMR $2 $1` -o archive.zip
      git diff --stat --name-status --diff-filter=D $2 $1 > deleted_files.txt
  fi