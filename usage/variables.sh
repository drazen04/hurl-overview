#!/usr/bin/env bash
export HURL_host=localhost
hurl --test --variable port=3000 chain-of-requests-with-var.hurl
