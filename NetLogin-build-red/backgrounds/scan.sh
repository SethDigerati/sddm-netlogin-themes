#!/bin/sh
cd "$(dirname "$0")" || exit 1
names=""
for f in *; do
  case "$f" in
    scan.sh|*.sh) continue ;;
    *) [ -z "$names" ] && names="$f" || names="$names,$f" ;;
  esac
done
[ -n "$names" ] && sed -i "s/^backgrounds=.*/backgrounds=\"$names\"/" ../theme.conf
