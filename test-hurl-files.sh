#!/usr/bin/env bash
export HURL_host=localhost
export HURL_port=3000

hurl --test concepts/*.hurl
hurl --test usage/*.hurl
