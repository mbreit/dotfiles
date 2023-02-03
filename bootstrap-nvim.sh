#!/bin/sh

nvim --headless "+Lazy! sync" +qa
nvim --headless +TSUpdateSync +qa
