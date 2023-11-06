#!/bin/bash
# Do we need a fake topology?
cpu0=`cat /sys/devices/system/cpu/cpu0/topology/core_id 2>/dev/null`
if [[ "$cpu0" != -1 ]]; then
    exit 0
fi
nproc=`nproc`
topology=()
for ((i = 0; i < nproc; ++i)); do
    topology+=(0:$i)
done
echo ${topology[@]}
