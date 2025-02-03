#!/usr/bin/env bash
set -Eeuxo pipefail

protoc \
		-I . \
		-I $(go list -m -f '{{.Dir}}/include' github.com/planetscale/vtprotobuf) \
		--go_out=paths=source_relative:. \
    --go-vtproto_out=paths=source_relative:. \
    --go-vtproto_opt=features=marshal+unmarshal+unmarshal_unsafe+size+pool+clone \
    --go-grpc_out=require_unimplemented_servers=false,paths=source_relative:. \
    ./prompb/io/prometheus/write/v2/types.proto
