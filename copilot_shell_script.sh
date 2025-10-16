#!/bin/bash


echo "--- Assignment Configuration Updater ---"

APP_DIR=$(find . -maxdepth 1 -type d -name "submission_reminder_*")

if [ -z "$APP_DIR" ]; then
    echo "Error: Could not find the 'submission_reminder_*' directory."
    echo "Please run this from the same folder where you ran create_environment.sh"
    exit 1
fi

read -p "Enter the new assignment name to check: " new_assignment

CONFIG_FILE="${APP_DIR}/config/config.env"

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"${new_assignment}\"/" "$CONFIG_FILE"

echo ""
echo "✅ Configuration updated successfully!"
echo "The assignment to check has been changed to: '${new_assignment}'"
echo ""
echo "To see the new results, navigate into '${APP_DIR}' and re-run './scripts/startup.sh'"
