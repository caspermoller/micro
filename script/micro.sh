#!/bin/bash

# Check if the script is being run with sudo
if [[ "$(id -u)" -ne 0 ]]; then
    echo "You need to run this script with sudo."
    exit 1
fi

# Check if curl is installed
if ! command -v curl &> /dev/null
then
    echo "Error: curl is not installed. Please install curl and try again."
    exit 1
fi

echo "Welcome to my Micro-script!"
echo "You can either choose to download and install Micro automatically, or just download the settings."
echo "Do you want Micro to be installed automatically? (y/N)"
read -r INSTALL_CHOICE

# Function to download settings
download_settings() {
    DESTINATION="/home/$SUDO_USER/.config/micro"
    # create folder if not exist
    echo "Echo: $SUDO_USER"
    sudo -u $SUDO_USER mkdir -p "$DESTINATION"

    # download init.lua and place it in destination
    if ! sudo -u $SUDO_USER curl https://raw.githubusercontent.com/caspermoller/micro/main/settings/init.lua -o "$DESTINATION/init.lua"; then
        echo "Error: Failed to download init.lua. Check your connection."
        exit 1
    fi

    # download settings.json and place it in destination
    if ! sudo -u $SUDO_USER curl https://raw.githubusercontent.com/caspermoller/micro/main/settings/settings.json -o "$DESTINATION/settings.json"; then
        echo "Error: Failed to download settings.json. Check your connection."
        exit 1
    fi

    echo "Settings downloaded successfully!"
#    echo "Folder created"
}

while [[ "$INSTALL_CHOICE" != "y" && "$INSTALL_CHOICE" != "N" ]]; do
    echo "Invalid input. Please choose either 'y' or 'N'."
    echo "Do you want Micro to be installed automatically? (y/N)"
    read -r INSTALL_CHOICE
done

if [[ "$INSTALL_CHOICE" == "y" ]]; then
    # Find OS type
    OS=""
    if [[ "$OSTYPE" == "darwin"* ]]; then
        OS="macOS"
    elif [[ -f /etc/os-release ]]; then
        . /etc/os-release
        case "$ID" in
            ubuntu|debian|linuxmint|popos) OS="Debian" ;;
            arch|manjaro|endeavouros) OS="Arch" ;;
            fedora|rocky) OS="Fedora" ;;
            opensuse*) OS="OpenSUSE" ;;
            *) OS="Unknown" ;;
        esac
    else
        OS="Unknown"
    fi

    # Install Micro if it is not already installed
    if ! command -v micro &>/dev/null; then
        echo "Downloading Micro!"
        case "$OS" in
            "macOS") 
                cd /usr/local/bin/ || { echo "Error: Could not change to /usr/local/bin"; exit 1; }
                curl -fsSL https://getmic.ro | bash -s -- -y || { echo "Error: Micro installation failed"; exit 1; }
                ;;
            "Debian") sudo apt update && sudo apt install -y micro ;;
            "Arch") sudo pacman -Sy --noconfirm micro ;;
            "Fedora") sudo dnf install -y micro ;;
            "OpenSUSE") sudo zypper install -y micro ;;
            *)
                echo "Unknown OS. Please run the script again to download settings manually."
                exit 1
                ;;
        esac
    else
        echo "Micro is already installed. Downloading settings..."
    fi

    # Download settings after installation
    download_settings
    echo "Installation complete! You can now use Micro. Enjoy your editing experience!"
    exit

elif [[ "$INSTALL_CHOICE" == "N" ]]; then
    echo "Do you want to download the settings for Micro manually? (y/N)"
    read -r DOWNLOAD_CHOICE

    while [[ "$DOWNLOAD_CHOICE" != "y" && "$DOWNLOAD_CHOICE" != "N" ]]; do
        echo "Invalid input. Please choose either 'y' or 'N'."
        echo "Do you want to download the settings for Micro manually? (y/N)"
        read -r DOWNLOAD_CHOICE
    done

    if [[ "$DOWNLOAD_CHOICE" == "y" ]]; then
        # Download Micro settings manually
        download_settings
    elif [[ "$DOWNLOAD_CHOICE" == "N" ]]; then
        echo "Goodbye."
        exit
    fi
else
    echo "Invalid input. Please choose either 'y' or 'N'."
    exit 1
fi
