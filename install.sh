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
      read -rn 1 -r user_input
      user_input=${user_input:-y}
      echo

      if [[ "$user_input" =~ ^[Yy]$ ]]; then
        echo "Installing dependencies..."
        sudo pacman -S --needed base-devel git 
      else 
        echo "Cannot proceed without dependencies. Exiting."
        return
      fi
    fi

    # Actually build yay
    git clone https://aur.archlinux.org/yay.git
    'cd yay || exit'
    echo "It is NEVER a good idea to install a package from the AUR without reading the PKGBUILD"
    echo "Would you like to read the PKGBUILD to check that yay isn't malicious? [Y/n]:"
    read -rn 1 user_input
    user_input=${user_input:-y}
    if [[ "$user_input" =~ ^[Yy]$ ]]; then 
      $PAGER PKGBUILD
    fi
    makepkg -si
    cd ..
}
 
  # Defined configure_ly function
  configure_ly(){
    while true; do
    echo "Would you like to use my ly configuration [Y/n]"
    read -rn 1 user_input
    user_input=${user_input=-y}
    
  case $user_input in
    [Yy]) 
    sudo cp -fb ./.config/ly/config.ini /etc/ly/config.ini
    break
    ;;
    [Nn])
    break
    ;; 
    [*])
    echo "Invalid input. Try again."
    echo
    configure_ly
    ;;
  esac
done
  }

install_oh-my-zsh(){
  while true; do
    echo "The default shell in these dotfiles is zsh, but the theme used is from oh-my-zsh"
    echo "Would you like to install oh-my-zsh? [Y/n]"
    read -rn 1 user_input
    user_input=${user_input=-y}

    case $user_input in
      [Yy])
      # oh-my-zsh install script
      sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
      break
      ;;

      [Nn])
      break 
      ;;

      [*])
      echo "Invalid input. Try again."
      echo
      install_oh-my-zsh
      ;;
    esac
  done
  }


# Flow of Script

# Ask to install yay

while true; do
echo -n "Do you want to install yay (aur package manager)? [Y/n]:" 

# Reads user input, making sure only one character can be input
read -rn 1 -r user_input
user_input=${user_input:-y}

  case $user_input in
   [Yy] ) 
     install_yay
     break
     ;;

   [Nn] )
     break 
     ;;

    * ) 
     echo "Invalid input. Try again."   
     echo

  esac 
done

# Install Dependencies for config

echo 
echo "Installing Dependencies..."
sudo pacman -S '$(awk ''{print $1}'' dependencies)'
echo 
# Ask to install_oh-my-zsh 
install_oh-my-zsh
echo ".config directory will be backed up as .config-bak"
echo " Overwritting .config directory"
sudo cp -bf ./.config ~/.config

# Ask to install ly
while true; do
echo "Would you like to install ly (TUI display manager)? [Y/n]"
read -rn 1 user_input
user_input=${user_input=-y}

  case $user_input in
   [Yy] ) 
     # Install Ly
     sudo pacman -S ly
     sudo systemctl enable ly@tty2.service
     sudo systemctl disable getty@tty2.service
     configure_ly
     break
     ;;
   [Nn] ) 
     break 
     ;;
     * )
     echo "Invalid Input. Try again." 
     echo
    ;;
  esac
done
# Set GTK and QT theme defaults
echo -e "GTK_THEME=Breeze:dark\n\
GTK2_RC_FILES=/usr/share/themes/Breeze-Dark/gtk-2.0/gtkrc\n\
QT_STYLE_OVERRIDE=Breeze-Dark" | sudo tee -a /etc/environment
