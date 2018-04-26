#!/bin/bash

function log
{
    echo "$(date "+%Y-%m-%d %H:%M:%S.%3N") - $0 - $@"
}

[[ -z $1 ]] && echo "Usage: $0 PG_DAILY_LOG_ENV_DIR" && exit 1

log "I was called as: $0 $@"

PG_DAILY_LOG_ENV_DIR=$1
shift

log "compressing and uploading to the cloud the postgres daily log"
exec nice -n 5 envdir "${PG_DAILY_LOG_ENV_DIR}" ship_yesterday_pg_log_to_s3.sh