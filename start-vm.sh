#!/bin/bash

resourceGroup="automation"
vmName="mylinuxvm"

# Check VM Power State
status=$(az vm get-instance-view --name "$vmName" --resource-group "$resourceGroup" --query instanceView.statuses[1].code -o tsv)

if [[ "$status" == "PowerState/running" ]]; then
    echo "✅ VM is already running."
else
    echo "🔄 Starting VM..."
    az vm start --resource-group "$resourceGroup" --name "$vmName"
    echo "✅ VM started successfully."
fi
