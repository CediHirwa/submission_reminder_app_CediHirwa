#!/bin/bash

read -p "Please enter your name for the main directory: " userName

MAIN_DIR="submission_reminder_${userName}"

echo "Creating directory structure in ./${MAIN_DIR}..."

mkdir -p "${MAIN_DIR}/app" "${MAIN_DIR}/config" "${MAIN_DIR}/data" "${MAIN_DIR}/scripts"


echo "Creating and populating application files..."

cat <<'EOF' > "${MAIN_DIR}/config/config.env"
# Configuration variables for the application
ASSIGNMENT="Linux Lab 2"
SUBMISSIONS_FILE="data/submissions.txt"
EOF

cat <<'EOF' > "${MAIN_DIR}/data/submissions.txt"
John Doe,Linux Lab 2,Submitted
Jane Smith,Linux Lab 2,Pending
Peter Jones,Web Dev Assignment,Submitted
Alice Williams,Linux Lab 2,Pending
Bob Brown,Linux Lab 2,Submitted
Charlie Davis,Linux Lab 2,Pending
Diana Miller,Web Dev Assignment,Pending
Eve Wilson,Linux Lab 2,Submitted
Frank Taylor,Linux Lab 2,Pending
Grace Moore,Web Dev Assignment,Submitted
Henry Clark,Linux Lab 2,Submitted
Ivy Rodriguez,Linux Lab 2,Pending
Leo Green,Web Dev Assignment,Pending
EOF

cat <<'EOF' > "${MAIN_DIR}/app/functions.sh"
#!/bin/bash
# This file holds the main logic.
check_pending_submissions() {
    echo "-------------------------------------------"
    echo "Checking for students with pending submissions for: '$ASSIGNMENT'"
    echo "-------------------------------------------"
    grep "$ASSIGNMENT" "$SUBMISSIONS_FILE" | grep "Pending" | cut -d, -f1
}
EOF

cat <<'EOF' > "${MAIN_DIR}/app/reminder.sh"
#!/bin/bash
# This script runs the main logic.
source "$(dirname "$0")/functions.sh"
check_pending_submissions
EOF

cat <<'EOF' > "${MAIN_DIR}/scripts/startup.sh"
#!/bin/bash
# This is the entry point to start the application.

# 1. Change to the application's root directory to make all paths work.
cd "$(dirname "$0")/.."

# 2. Load the variables from the config file.
source "config/config.env"

# 3. Execute the main reminder script.
bash "app/reminder.sh"
EOF

echo "Setting execute permissions on all .sh files..."
chmod +x "${MAIN_DIR}/app"/*.sh
chmod +x "${MAIN_DIR}/scripts"/*.sh

echo ""
echo "✅ Environment setup is complete!"
echo "To start the application, run the following commands:"
echo "cd ${MAIN_DIR}"
echo "./scripts/startup.sh"

