#!/bin/bash
curl -s 'https://corona.lmao.ninja/v3/covid-19/all' | jq -r '.cases'
