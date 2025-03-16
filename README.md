# Micro Installer Script

This script is designed to easily install the **Micro** text editor on various operating systems (macOS, Debian-based systems like Ubuntu, Arch, Fedora, and OpenSUSE), as well as download and configure the necessary settings that i like. I may update the settings eventually.

## Disclaimer

This script was primarily created for personal use, based on my preferences for the **Micro** text editor and its settings. However, you are welcome to use it if it fits your needs. I cannot guarantee it will work perfectly in all environments, but feel free to modify it as you see fit. It's only tested on Mac and a couple of Debian-based Linux distros, bit it should work for other systems as well.

## Features

- **Automatic Micro Installation**: The script downloads and installs Micro if it's not already installed.
- **Support for multiple operating systems**: The script can detect and install Micro on macOS, Debian, Arch, Fedora, and OpenSUSE.
- **Download default settings**: The script downloads the settings how I like them.
- **Check for sudo rights**: The script requires `sudo` for installation and informs the user if they don't have the necessary permissions.

## Installation

1. **Download and run the script:**

   ```bash
   curl https://raw.githubusercontent.com/caspermoller/micro/main/script/micro.sh -o micro_installer.sh 
   sudo bash micro_installer.sh
   sudo rm micro_installer.sh	
   ```

3. **Choose installation type**:
   - When running the script, you will be prompted to choose whether you want to install Micro automatically or only download the settings.
   - If you choose to install Micro automatically, the script will also download the necessary settings for Micro.

4. **Done!** Once the installation is complete, you can start using Micro with the loaded settings.

## Requirements

- `sudo` (administrator privileges) are required for installation. The script will not run, if sudo isn't specified.
- `curl` must be installed on the system to fetch Micro and the settings.

## Supported Operating Systems

- **macOS**
- **Debian-based systems** (e.g., Ubuntu, Linux Mint, Pop!_OS)
- **Arch Linux** and derivatives (e.g., Manjaro, EndeavourOS) (not tested yet)
- **Fedora** (not tested yet)
- **OpenSUSE** (not tested yet)

## To-do list

- **curl:** it's my plan to add a feature that can install curl, if it isn't installed already.
- **Test:** in the future i'm gonna test the script on Arch, Fedora and OpenSUSE, but as i never used theese systems before, it's not mynumber one priority at the moment.

## Error Handling

- If the script cannot install Micro, it will display error messages and exit with status 1.
- If Micro is already installed, the script will only download and configure the necessary settings.
