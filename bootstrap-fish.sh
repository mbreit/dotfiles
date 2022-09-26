#!/bin/sh

# Run fundle install twice, plugins are installed in second call
fish -ic "fundle install"
fish -ic "fundle install"
