#!/usr/bin/env bash
set -e

readonly SUBREPO=rtm-yaml

find . -type f -name '*.rs' -print0 | xargs --null redo-ifchange

pushd ./..
  git subrepo pull ${SUBREPO}
  git subrepo push ${SUBREPO}
popd
