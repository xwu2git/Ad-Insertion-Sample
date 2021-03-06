#!/bin/bash -e

DIR=$(dirname $(readlink -f "$0"))

shift
. "$DIR/build.sh"

function create_secret {
    kubectl create secret generic self-signed-certificate "--from-file=${DIR}/../../certificate/self.crt" "--from-file=${DIR}/../../certificate/self.key"
}

# create secrets
create_secret 2>/dev/null || (kubectl delete secret self-signed-certificate; create_secret)

helm install adi "$DIR/adi"
