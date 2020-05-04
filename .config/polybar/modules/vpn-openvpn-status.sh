#!/bin/sh
if nordvpn status | grep -q Connected
then 
   echo " | VPN:Up";
else
   echo " | VPN:Down";
fi