#!/usr/bin/env bash

PID_LIST=()

# NRF > UDR > UDM > AUSF > NSSF > AMF > PCF > UPF > SMF > N3IWF
# s5uishida -> "nrf amf smf udr pcf udm nssf ausf"
NF_LIST="nrf udr udm ausf nssf amf pcf upf smf"

export GIN_MODE=release

for NF in ${NF_LIST}; do
    ./bin/${NF} &
    PID_LIST+=($!)
    sleep 1
done

function terminate()
{
    sudo kill -SIGTERM ${PID_LIST[${#PID_LIST[@]}-2]} ${PID_LIST[${#PID_LIST[@]}-1]}
    sleep 2
}

trap terminate SIGINT
wait ${PID_LIST}
