#! /usr/bin/env bash

# make sure devbox global is activated
eval "$(devbox global shellenv)"

bat cache --build
