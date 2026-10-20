#!/bin/bash
# exits when no librelane flow is running in any container
while docker ps --no-trunc --format '{{.Names}} {{.Command}}' | grep -q librelane; do sleep 300; done
echo free
