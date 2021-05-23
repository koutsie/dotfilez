#!/bin/bash
df -Ph . | tail -1 | awk '{print $4}'

