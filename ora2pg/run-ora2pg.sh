#/bin/sh
docker run -it --rm -v /mnt/c/dev/techbeer/oracle2cosmos/ora2pg/config:/config -v /mnt/c/dev/techbeer/oracle2cosmos/ora2pg/data:/data georgmoser/ora2pg ora2pg  -c /config/ora2pg.conf "$@"