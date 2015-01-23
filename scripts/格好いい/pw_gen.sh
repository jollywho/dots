#!/usr/bin/bash
cat /dev/urandom | strings | tr -d '\n' | head -c32 
