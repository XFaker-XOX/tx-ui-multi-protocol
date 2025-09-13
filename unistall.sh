#!/bin/bash
    systemctl stop tx-ui-multi-protocol
    systemctl disable tx-ui-multi-protocol
    rm -f /etc/systemd/system/tx-ui-multi-protocol.service 
    systemctl daemon-reload
    systemctl reset-failed
    rm -rf /etc/tx-ui-multi-protocol 
    rm -rf tx-ui-multi-protocol/tx-ui-multi-protocol 
    sudo apt-get purge dotnet-sdk-7.0
     sudo rm -f /etc/apt/sources.list.d/microsoft-prod.list && sudo apt update

    echo "Uninstalled Successfully!"

