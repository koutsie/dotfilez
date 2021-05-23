#!/bin/bash
ping -qc1 aqua.wtf 2>&1 | awk -F'/' 'END{ print (/^rtt/? "OK "$5" ms":"FAIL") }'
