#!/usr/bin/env bash
set -e

readonly SUBREPO=rtm-yaml

redo-ifchange tests/status

find . -type f -name '*.rs' -print0 | xargs --null redo-ifchange

pushd ./..
  git subrepo clean ${SUBREPO}
  git subrepo pull ${SUBREPO}
  # ingydotnet/git-subrepo/issues/530
  git subrepo push ${SUBREPO} --force
popd

# Even if a source file has changed, a redo script that monitors this,
# will consider it changed only if there hs been a change across test results.
cat tests/status | redo-stamp
