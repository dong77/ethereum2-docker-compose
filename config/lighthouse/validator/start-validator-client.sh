#! /bin/bash

DEFAULT_NETWORK=mainnet

# Set network name
if [ "$NETWORK" = "" ]; then
	NETWORK=$DEFAULT_NETWORK
fi

# Base dir
DATADIR=/root/.lighthouse/$NETWORK

WALLET_NAME=validators
WALLET_PASSFILE=$DATADIR/secrets/$WALLET_NAME.pass


if [ "$START_VALIDATOR" != "" ]; then
	if [ "$IMPORT_LAUNCHPAD_KEYSTORES" != "" ]; then
		echo "$LAUNCHPAD_KEYSTORE_PASSWD" | lighthouse \
			--network $NETWORK \
			account validator import \
			--directory /root/validator_keys \
			--reuse-password \
			--stdin-inputs
	else
		echo "Wallet not imported"
	fi

	exec lighthouse \
		--debug-level $DEBUG_LEVEL \
		--network $NETWORK \
		validator \
		--beacon-nodes http://beacon:5052 \
		--init-slashing-protection
fi