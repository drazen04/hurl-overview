#!/usr/bin/env bash

# Every hurl file is repeated N times in parallel.
# You can tune parallel jobs. Eg. (run test sequentially) ```hurl --test --jobs 1 repeat 500 .

hurl --test --repeat $1 .
#      ^^^^ 'test' execute in parallel by default
