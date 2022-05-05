#!/usr/bin/env bash
set -e

readonly SUBREPO=rtm-yaml

find . -type f -name '*.rs' -print0 | xargs --null redo-ifchange

pushd ./..
  git subrepo clean ${SUBREPO}
  git subrepo pull ${SUBREPO}
  # ingydotnet/git-subrepo/issues/530
  git subrepo push ${SUBREPO} --force
popd
