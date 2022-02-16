#!/bin/bash

# Check vars 
[ -z "$BEACON_RPC_PROVIDER" ] && echo "WARNING: BEACON_RPC_PROVIDER is not set" || echo "INFO: BEACON_RPC_PROVIDER ${BEACON_RPC_PROVIDER}"
[ -z "$BEACON_RPC_GATEWAY_PROVIDER" ] && echo "WARNING: BEACON_RPC_GATEWAY_PROVIDER is not set" || echo "INFO: BEACON_RPC_GATEWAY_PROVIDER ${BEACON_RPC_GATEWAY_PROVIDER}"
[ -z "$GRAFFITI" ] && echo "WARNING: GRAFFITI is not set" || echo "INFO: GRAFFITI ${GRAFFITI}"

# Must used escaped \"$VAR\" to accept spaces: --graffiti=\"$GRAFFITI\"
exec -c validator \
  --prater \
  --datadir=/root/.eth2 \
  --rpc-host 0.0.0.0 \
  --monitoring-host 0.0.0.0 \
  --beacon-rpc-provider=${BEACON_RPC_PROVIDER} \
  --beacon-rpc-gateway-provider=${BEACON_RPC_GATEWAY_PROVIDER} \
  --validators-external-signer-url=http://web3signer:9003 \
  --validators-external-signer-public-keys=http://web3signer:9003/api/v1/eth2/publicKeys \
  --graffiti=\"$GRAFFITI\" \
  --grpc-gateway-host=0.0.0.0 \
  --grpc-gateway-port=80 \
  --accept-terms-of-use