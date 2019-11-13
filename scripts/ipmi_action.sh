#!/usr/bin/env bash
# 

#vars
ipmi_user='root'
ipmi_pass='hy1978brid1978'
ipmi_host=$1


function checkStatus () {
  ipmitool -I lanplus -H ${ipmi_host} -U ${ipmi_user} -P ${ipmi_pass} chassis power status
}

function powerOn () {
  ipmitool -I lanplus -H ${ipmi_host} -U ${ipmi_user} -P ${ipmi_pass} power on
}

function powerOff () {
  ipmitool -I lanplus -H ${ipmi_host} -U ${ipmi_user} -P ${ipmi_pass} power off
}

case "$2" in
  status)
      echo -e "Checking power status of ${ipmi_host}"
      checkStatus
      exit 0
  ;;

  on)
      echo -e "Powering ${ipmi_host} on.."
      powerOn
      exit 0
  ;;

  off)
      echo -e "Powering ${ipmi_host} off.."
      powerOff
      exit 0
  ;;

  *)
      echo -e "Usage ${0} hostname status|on|of"
      echo -e "Example: ${0} virt1-ilo.infra.arl.lab on"
      exit 0
esac
