#!/usr/bin/env bash

hurl --test --repeat $1 chain-of-requests.hurl
#             ^^^^^^ repeat chain of requests in file hurl N times
