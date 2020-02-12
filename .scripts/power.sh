#!/bin/bash

# Simple script to handle a DIY shutdown menu. When run you should see a bunch of options (shutdown, reboot etc.)

chosen=$(echo -e "[Cancel]\nLogout\nShutdown\nReboot\nSleep\nHibernate\nHybrid-sleep\nSuspend-then-hibernate" | rofi -dmenu)
if [[ $chosen = "Logout" ]]; then
	gnome-session-quit --logout --no-prompt
elif [[ $chosen = "Shutdown" ]]; then
	gnome-session-quit --power-off --no-prompt
elif [[ $chosen = "Reboot" ]]; then
	gnome-session-quit --reboot --no-prompt
elif [[ $chosen = "Sleep" ]]; then
	systemctl suspend
elif [[ $chosen = "Hibernate" ]]; then
	systemctl hibernate
elif [[ $chosen = "Hybrid-sleep" ]]; then
	systemctl hibernate
elif [[ $chosen = "Suspend-then-hibernate" ]]; then
	systemctl suspend-then-hibernate
fi