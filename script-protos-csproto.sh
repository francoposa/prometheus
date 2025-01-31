#!/usr/bin/env bash
set -Eeuo pipefail

protoc \
		-I . \
		--go_out=paths=source_relative:. \
		--fastmarshal_out=apiversion=v2,enableunsafedecode=true,paths=source_relative:. \
		--go-grpc_out=require_unimplemented_servers=false,paths=source_relative:. \
        ./prompb/io/prometheus/write/v2/types.proto
