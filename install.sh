#! /bin/bash

# Functions (Main Logic)

install_yay() {

# Needed to check for git and base-devel to install yay
check_dep() {
  if pacman -Qi "$1" &> /dev/null; then
    echo "Check: $1 is already installed"
  else
    echo "Error: $1 is missing"
    return 1
  fi
}
    # Check for Dependencies
    echo
    echo "Checking for Dependencies..."
    if ! (check_dep "base-devel") || ! (check_dep "git"); then
      echo -n "Required dependencies are missing. Install them? [Y/n]:"
      read -n 1 -r user_input
      user_input=${user_input:-y}
      echo

      if [[ "$user_input" =~ ^[Yy]$ ]]; then
        echo "Installing dependencies..."
        sudo pacman -S --needed base-devel git 
      else 
        echo "Cannot proceed without dependencies. Exiting."
        exit 1
      fi
    fi

    # Actually build yay
    git clone https://aur.archlinux.org/yay.git
    cd yay 
    echo "It is NEVER a good idea to install a package from the AUR without reading the PKGBUILD"
    echo "Would you like to read the PKGBUILD to check that yay isn't malicious? [Y/n]:"
    read -n 1 -r u
    user_input=${user_input:-y}
    if [[ "$user_input" =~ ^[Yy]$ ]]; then
      exec $PAGER PKGBUILD
    fi
    makepkg -si
}

# Flow of Script

# Ask to install
echo -n "Do you want to install yay (aur package manager)? [Y/n]:" 

# Reads user input, making sure only one character can be input
read -n 1 -r user_input
user_input=${user_input:-y}

case $user_input in
  [Yy] ) 
    install_yay
    ;;
  [Nn] )

    ;;
    * )
    echo "Invalid input. Exiting."
    exit 1
esac     

# Install Dependencies for config
echo 
echo "Installing Dependencies..."
sudo pacman -S $(awk '{print $1}' ./dependencies)
echo 
echo "Overwritting .config directory"
mv -f --backup=.configbak ./.config ~/.config
