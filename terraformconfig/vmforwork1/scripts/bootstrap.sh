#!/bin/bash

echo "Current date and time at action execution is: $(date)"

apt update && apt upgrade -y
curl https://ollama.com/install.sh | sh