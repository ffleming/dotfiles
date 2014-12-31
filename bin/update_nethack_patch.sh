#!/usr/bin/env bash

PWD="$(pwd)"
NETHACK_DIR="$HOME/Personal/nethack"
VANILLA_DIR="nethack-3.4.3"
PATCHED_DIR="nethack-3.4.3-nao-osx"
STAGING_SERVER="http://poopbutts.info"
PATCH_FILENAME="nethack-3.4.3-nao-osx.diff"
SCP_HOST='apis'
SCP_PATH='/home/ffleming/all_domains/poopbutts.info'
LOCAL_DATE=$(date -j +%s)

cd "$NETHACK_DIR/$PATCHED_DIR"
make spotless > /dev/null

cd "$NETHACK_DIR"
diff --exclude=.git* --exclude=*.diff --exclude=*.patch --exclude=Makefile -rupN "$VANILLA_DIR/" "$PATCHED_DIR/" > "$PATCH_FILENAME"
scp -q "$PATCH_FILENAME" "$SCP_HOST":"$SCP_PATH"/"$PATCH_FILENAME"
UPDATED_DATE=$(curl -sI "$STAGING_SERVER/$PATCH_FLENAME" |  egrep 'Last-Modified' | cut -c16- | date -j +%s)
cd "$PWD"

if [ "$LOCAL_DATE" -le "$UPDATED_DATE" ]; then
  echo 'Updated successfully'
else
  echo 'There was a problem with the update'
fi
