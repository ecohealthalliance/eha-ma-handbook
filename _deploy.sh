#!/bin/bash

set -e

[ -z "${GITHUB_PAT}" ] && exit 0
[ "${TRAVIS_BRANCH}" != "master" ] && exit 0

git config --global user.email "ross@ecohealthalliance.org"
git config --global user.name "Noam Ross"

DOCS_DIR=docs
REMOTE_URL=$(git config --get remote.origin.url)

mkdir -p ${DOCS_DIR}
rm -rf ${DOCS_DIR}/.git
git init ${DOCS_DIR}
git -C ${DOCS_DIR} checkout --orphan gh-pages
git -C ${DOCS_DIR} add .
git -C ${DOCS_DIR} commit --no-verify -m "Update docs (automated commit)"
git -C ${DOCS_DIR} remote add origin -m "gh-pages" ${REMOTE_URL}
git -C ${DOCS_DIR} push --force -u origin gh-pages