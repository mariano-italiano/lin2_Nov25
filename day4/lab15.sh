#!/bin/bash
# Lab 15 - Sygnały

LOGFILE=/tmp/skrypt.signals
CTRLC=0
TERM=0

function przechwyc_sigint {
	CTRLC=$(( $CTRLC + 1 ))
	echo 
	if [[ $CTRLC > 0 ]]; then
		echo "Wystąpił sygnał SIGINT(2) $CTRLC raz(y)" >> $LOGFILE
	fi
}

function przechwyc_sigterm {
         TERM=$(( $TERM + 1 ))
         echo
         if [[ $TERM > 0 ]]; then
		echo "SORRY ale tak mnie nie zamkniesz" >> $LOGFILE
         fi
}

trap przechwyc_sigint SIGINT
trap przechwyc_sigterm SIGTERM

while true
do
	#echo "Śpimy 10 sekund"
	sleep 10
done
