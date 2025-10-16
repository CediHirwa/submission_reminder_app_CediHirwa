This repository contains the scripts to build and manage a shell-based application for checking pending student assignment submissions.

--

This project consists of two primary scripts:
1.  `create_environment.sh`: An automated script that builds the entire application directory structure and populates it with the necessary files.
2.  `copilot_shell_script.sh`: A helper script to easily change the assignment name that the application checks for.

The final submission repository should only contain these two scripts and this README file.

---

To begin, you must generate the application's files and folders using the setup script.

1.  **Clone the Repository:**
    ```bash
    git clone <your-repo-url>
    cd <your-repo-name>
    ```

2.  **Make the Setup Script Executable:**
    This command gives your user permission to run the file as a program.
    ```bash
    chmod +x create_environment.sh
    ```

3.  **Run the Script:**
    Execute the script and follow the on-screen prompt.
    ```bash
    ./create_environment.sh
    ```
    This will ask for your name and create a `submission_reminder_{yourName}` directory containing the full application.

---
Once the environment is created, you can run the application to check for pending submissions.

1.  **Navigate into the App Directory:**
    Replace `{yourName}` with the name you provided during setup.
    ```bash
    cd submission_reminder_{yourName}
    ```

2.  **Execute the Startup Script:**
    ```bash
    ./scripts/startup.sh
    ```
    The output will list all students with a `Pending` status for the default assignment ("Linux Lab 2").

---

Use the `copilot_shell_script.sh` to change which assignment is being checked.

1.  **Navigate to the Root of Your Repository:**
    Ensure you are in the main project directory, not the `submission_reminder_*` directory.

2.  **Run the Copilot Script:**
    (You only need to run `chmod +x copilot_shell_script.sh` once).
    ```bash
    ./copilot_shell_script.sh
    ```
    Enter a new assignment name when prompted (e.g., "Web Dev Assignment"). The script will update the configuration automatically.

3.  **Re-run the App:**
    Follow the steps in **Section 2** again to see the results for the new assignment.
