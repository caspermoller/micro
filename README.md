# Micro Installer Script

This script is designed to easily install the **Micro** text editor on various operating systems (macOS, Debian-based systems like Ubuntu, Arch, Fedora, and OpenSUSE), as well as download and configure the necessary settings for Micro.

## Features

- **Automatic Micro Installation**: The script downloads and installs Micro if it's not already installed.
- **Support for multiple operating systems**: The script can detect and install Micro on macOS, Debian, Arch, Fedora, and OpenSUSE.
- **Download default settings**: The script downloads standard Micro settings from an external repository and saves them in the correct directory on your machine.
- **Check for sudo rights**: The script requires `sudo` for installation and informs the user if they don't have the necessary permissions.

## Installation

1. **Clone the script to your local machine:**

   ```bash
   git clone https://github.com/your-username/micro-installer.git
   cd micro-installer
   ```

2. **Grant execute permissions to the script:**

   ```bash
   chmod +x micro-install.sh
   ```

3. **Run the script:**

   - To run the script, use `sudo`:
   
     ```bash
     sudo ./micro-install.sh
     ```

4. **Choose installation type**:
   - When running the script, you will be prompted to choose whether you want to install Micro automatically or only download the settings.
   
   - If you choose to install Micro automatically, the script will also download the necessary settings for Micro.

5. **Done!** Once the installation is complete, you can start using Micro with the loaded settings.

## Requirements

- `sudo` (administrator privileges) are required for installation.
- `curl` must be installed on the system to fetch Micro and the settings.

## Supported Operating Systems

- **macOS**
- **Debian-based systems** (e.g., Ubuntu, Linux Mint, Pop!_OS)
- **Arch Linux** and derivatives (e.g., Manjaro, EndeavourOS)
- **Fedora**
- **OpenSUSE**

## Error Handling

- If the script cannot install Micro, it will display error messages and exit with status 1.
- If Micro is already installed, the script will only download and configure the necessary settings.
