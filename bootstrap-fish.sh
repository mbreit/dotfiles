#!/bin/sh

FISH_FUNDLE_INSTALL=true fish -c "fundle install; sleep 1; kill \$fish_pid"

