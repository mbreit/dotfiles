#!/bin/sh

# Run fundle install twice, plugins are installed in second call
TERM=dumb fish -ic "fundle install"
TERM=dumb fish -ic "fundle install"
