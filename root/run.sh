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

touch /var/log/error.log
touch /var/log/access.log
chown -R ${user}:${group} /var/log

# Print log messages to stdout
tail -F /var/log/error.log /var/log/access.log &

# Run Maraschino in foreground
runcmd="lighttpd -f /etc/lighttpd/lighttpd.conf -D"
exec ${runcmd}

