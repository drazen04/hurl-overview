#!/usr/bin/env bash
export HURL_host=localhost
#      ^^^^^ with this prefix hurl automatically use 'host' (or whatever is the var name) in hurl file as variable

hurl --test --variable port=3000 chain-of-requests-with-var.hurl
#             ^^^^^^^^ another way to inject variables
