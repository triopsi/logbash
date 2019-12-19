#!/bin/bash
################################################################################
### Log-Funktionen:

function logInfo
{
  local ts
  ts="$(date +'%Y%m%d-%H%M%S%z')"
  echo "${ts} INFO $*"
}

function logWarn
{
  local ts
  ts="$(date +'%Y%m%d-%H%M%S%z')"
  echo "${ts} WARN $*"
}

function logErr
{
  local ts
  ts="$(date +'%Y%m%d-%H%M%S%z')"
  echo "${ts} ERROR $*"
  echo "${ts} ERROR $*" >&2
}

# Exit Function
function exit_bash ()
{
        local exitcode=$1
	if [ $exitcode -eq 0 ];then
		echo "Beenden RC=0"
	else
		logErr "Abbruch RC=$1"
	fi
	DATE=`date '+%Y-%m-%d %H:%M:%S'`
	echo "Ende: $DATE "
	exit $1
}

# LOG Info
logInfo "Dies ist eine Info Nachricht"

# LOG Warn
logWarn "Dies ist eine Warn Nachricht"

# LOG Error
logErr "Dies ist eine Error Nachricht"

# Beenden und loggen
exit_bash 99