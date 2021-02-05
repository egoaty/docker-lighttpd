#!/bin/sh
##
## Run the daemon (lighttpd)
##
## Environment Variables:
##  PUID    ... unprivileged UID
##  PGID    ... unprivileged GID
##

user="lighttpd"
group="lighttpd"
if ! id ${user} >/dev/null 2>&1; then
        addgroup -g "${PGID:=100000}" "${group}"
        adduser -h / -H -D -G "${group}" -u "${PUID:=100000}" "${user}"
fi

chown -R ${user}:${group} /var/log

# Run Maraschino in foreground
runcmd="lighttpd -f /etc/lighttpd/lighttpd.conf -D"
exec ${runcmd}

