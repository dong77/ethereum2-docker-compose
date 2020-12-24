#! /bin/bash
#
# Starts a beacon node.

DEFAULT_NETWORK=mainnet

if [ "$START_VALIDATOR" != "" ]; then
        ETH1_FLAG=--eth1
fi


if [ "$NETWORK" = "" ]; then
        NETWORK=$DEFAULT_NETWORK
fi

if [ "$ENABLE_METRICS" != "" ]; then
        METRICS_PARAMS="--metrics --metrics-address 0.0.0.0"
fi

if [ "$GRAFFITI" != "" ]; then
        GRAFFITI_PARAM="--graffiti $GRAFFITI"
fi

exec lighthouse \
        beacon_node \
        --debug-level $DEBUG_LEVEL \
        --network $NETWORK \
        --eth1-endpoint $VOTING_ETH1_NODE \
        --http \
        --http-address 0.0.0.0 \
        $METRICS_PARAMS \
        --max-skip-slots 700 \
        $GRAFFITI_PARAM \
        $ETH1_FLAG
