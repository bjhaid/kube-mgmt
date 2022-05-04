#!/bin/sh
set -e
set -x

if [ $# -ne 1 ]; then
    echo "Usage: test.sh OPA_URL"
    exit 1
fi

OPA_URL=$1

TOKEN=$(kubectl exec deploy/kube-mgmt-opa -c mgmt -- cat /bootstrap/mgmt-token)

# check default policy applied
DATA="$(http --verify=no -A bearer -a ${TOKEN} ${OPA_URL}/v1/data)"

CNT="$(echo "${DATA}" | jq '.result.test_helm_kubernetes_quickstart|keys|length')"

if [ ${CNT} -ne 3 ]; then
    echo "Check #1 failed: $CNT != 3"
    exit 1
fi

