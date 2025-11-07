#!/usr/bin/env bash
hurl --test --repeat $1 *.hurl --report-junit junit/report.xml
