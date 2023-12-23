#!/bin/bash

GREEN='\033[92m'
BLUE='\033[96m'
YELLOW='\033[93m'
NC='\033[0m' 
MAGENTA="\e[95m"
BOLD=$(tput bold)
CYAN="\e[96m"
RED="\e[91m"

color () {
    local color=$1
    local text=$2
    
    case $color in
        "red")
        printf "\e[91m${text}\e[0m\n";;
        "green")
        printf "\e[92m${text}\e[0m\n";;
        "yellow")
        printf "\e[93m${text}\e[0m\n";;
        "blue")
        printf "\e[94m${text}\e[0m\n";;
        "magenta")
        printf "\e[95m${text}\e[0m\n";;
        "cyan")
        printf "\e[96m${text}\e[0m\n";;
        *)
            echo "${text}"
        ;;
    esac
}

press_enter() {
    color red "\nPress Enter to continue... "
    read
}

root() {
if [ "$(id -u)" != "0" ]; then
    color red "This command must be run as root."
    exit 1
fi
}

ask_reboot() {
echo ""
echo -e "\n ${YELLOW}Reboot now? (Recommended) ${GREEN}[y/n]${NC}"
echo ""
read reboot
case "$reboot" in
        [Yy]) 
        systemctl reboot
        ;;
        *) 
        return 
        ;;
    esac
exit
}

function display_logo() {
echo -e "\033[1;96m$logo\033[0m"
}
# azumi art
logo=$(cat << "EOF"

  \033[96m  ______   \033[1;94m _______  \033[1;92m __    \033[1;93m  _______      \033[1;91m    __      \033[1;96m  _____  ___  
 \033[96m  /    " \  \033[1;94m|   __ "\ \033[1;92m|" \  \033[1;93m  /"      \     \033[1;91m   /""\     \033[1;96m (\"   \|"  \ 
 \033[96m // ____  \ \033[1;94m(. |__) :)\033[1;92m||  |  \033[1;93m|:        |    \033[1;91m  /    \   \033[1;96m  |.\\   \    |
 \033[96m/  /    ) :)\033[1;94m|:  ____/ \033[1;92m|:  |  \033[1;93m|_____/   )    \033[1;91m /' /\  \   \033[1;96m |: \.   \\  |
 \033[96m(: (____/ //\033[1;94m(|  /     \033[1;92m|.  |  \033[1;93m //       /   \033[1;91m //  __'  \  \033[1;96m |.  \    \ |
  \033[96m\        / \033[1;94m/|__/ \   \033[1;92m/\  |\ \033[1;93m |:  __   \  \033[1;91m /   /  \\   \ \033[1;96m |    \    \|
 \033[96m \"_____ / \033[1;94m(_______) \033[1;92m(__\_|_)\033[1;93m |__|  \___) \033[1;91m(___/    \___) \033[1;96m\___|\____\)⠀
\033[93m─────────────────────────────────────────────────────────────────────\033[0m
\033[92mCodes Edited by: github.com/Azumi67 \033[96m| \033[93mOriginal Author: github.com/donaldzou \033[0m    
EOF
)

update_system() {
  clear
    echo -e "${GREEN}Updating your OS and installing WireGuard...${NC}"
    echo ""
    apt-get update -y
    apt-get install -y curl wireguard subversion python3 git gunicorn python3-pip > /dev/null 2>&1 
    echo ""
    echo -e "${GREEN}Updating your OS and installing neccessary packages was done.${NC}"
    echo -e "\033[93m────────────────────────────────────────────────\033[0m"
    press_enter
}

configure_wireguard() {
  clear
  if ! command -v wg &>/dev/null; then
    echo -e "${RED}WireGuard is not installed. Please run the ${GREEN}'Install and configure dashboard' function first.${NC}"
    return
  fi

  echo
  echo -e "\033[93m────────────────────────────────────────────────\033[0m"
  echo -e "${YELLOW}WireGuard Configuration Starting:${NC}"
  echo -e "\033[93m────────────────────────────────────────────────\033[0m"

  read -e -p "$(printf "${GREEN}Enter your interface name (e.g., eth0, ens3): ${NC}")" interface
  read -e -p "$(printf "${GREEN}Enter your WireGuard port: ${NC}")" wireguard_port
  read -e -p "$(printf "${GREEN}Enter your WireGuard interface name (e.g., wg0): ${NC}")" wg_interface

  if [[ -e "/etc/wireguard/$wg_interface.conf" ]]; then
    read -p "$(printf "${RED}WireGuard interface '$wg_interface' already exists. Do you want to overwrite it? (y/n): ${NC}")" overwrite_choice
    if [[ "$overwrite_choice" != "y" ]]; then
      echo -e "${RED}Exiting...${NC}"
      exit 1
    else
      wg-quick down $wg_interface
      rm "/etc/wireguard/$wg_interface.conf"
      rm "/etc/wireguard/server_private.key"
    fi
  fi

  echo -e "\033[93m─────────────────────────────────────────────────────────────────────\033[0m"

  privateip4=""
  select_ipv4_range privateipv4

  echo -e "\033[93m─────────────────────────────────────────────────────────────────────\033[0m"

  privateip6=""
  select_ipv6_range privateipv6

  private_key=$(wg genkey)
  echo "$private_key" | sudo tee /etc/wireguard/server_private.key

  echo -e "\033[93m────────────────────────────────────────────────\033[0m"
  echo -e "${GREEN}Creating WireGuard configuration file...${NC}"

  cat <<EOF | sudo tee "/etc/wireguard/$wg_interface.conf"
[Interface]
Address = $privateip4, $privateip6
PostUp = iptables -I INPUT -p udp --dport $wireguard_port -j ACCEPT
PostUp = iptables -I FORWARD -i $interface -o $wg_interface -j ACCEPT
PostUp = iptables -I FORWARD -i $wg_interface -j ACCEPT
PostUp = iptables -t nat -A POSTROUTING -o $interface -j MASQUERADE
PostUp = ip6tables -I FORWARD -i $wg_interface -j ACCEPT
PostUp = ip6tables -t nat -A POSTROUTING -o $interface -j MASQUERADE
PostDown = iptables -D INPUT -p udp --dport $wireguard_port -j ACCEPT
PostDown = iptables -D FORWARD -i $interface -o $wg_interface -j ACCEPT
PostDown = iptables -D FORWARD -i $wg_interface -j ACCEPT
PostDown = iptables -t nat -D POSTROUTING -o $interface -j MASQUERADE
PostDown = ip6tables -D FORWARD -i $wg_interface -j ACCEPT
PostDown = ip6tables -t nat -D POSTROUTING -o $interface -j MASQUERADE
ListenPort = $wireguard_port
PrivateKey = $private_key
SaveConfig = true
EOF

  echo -e "${GREEN}Wireguard service was created and configured successfully.${NC}"
  echo -e "\033[93m────────────────────────────────────────────────\033[0m"
  echo -e "${GREEN}Starting WireGuard service...${NC}"
  sudo wg-quick up $wg_interface
  sleep 3
}

select_ipv4_range() {
  while true; do
    print_ipv4_menu
    echo -ne "${GREEN}Select an option ${RED}[1-5]: ${NC}"
    read option_ipv4

    case $option_ipv4 in
        1)
        privateip4="10.42.0.0/24";
        break
        ;;
        2)
        privateip4="10.87.0.0/24";
        break
        ;;
        3)
        privateip4="10.159.0.0/24";
        break
        ;;
        4)
        privateip4="10.203.0.0/24";
        break
        ;;
        5)
        echo ""
        echo ""
        echo -ne "${YELLOW}Enter your desire private ipv4 subnet ${GREEN}[e.g. 192.168.0.1/24]: ${NC}"
        read privateipv4
        echo ""
        break
        ;;
      0) color red "Exiting..."; exit 1 ;;
      *) color red "Invalid option. Try again." ;;
    esac
  done
}

print_ipv4_menu() {
  printf "+---------------------------------------------+\n"
  echo -e "$MAGENTA$BOLD           Private IPv4 Interface ${NC}"
  printf "+---------------------------------------------+\n"
  echo ""
  color magenta "!!!WARNING!!!"
  color red "If you want to add more interface(wg.conf, wg1.conf, ...)"
  color red "they should NOT be the same IPv4 subnet"
  color red "For example,for wg0.conf: 10.42.0.0/24 and for wg1.conf: 10.87.0.0/24 and for wg2.conf: 10.159.0.0/24, ...."
  echo
  echo -e "${CYAN}  1${NC}) ${YELLOW}Range IP 10.42.0.0/24${NC}"
  echo -e "${CYAN}  2${NC}) ${YELLOW}Range IP 10.87.0.0/24${NC}"
  echo -e "${CYAN}  3${NC}) ${YELLOW}Range IP 10.159.0.0/24${NC}"
  echo -e "${CYAN}  4${NC}) ${YELLOW}Range IP 10.203.0.0/24${NC}"
  echo -e "${CYAN}  5${NC}) ${YELLOW}Enter custom private IPv4${NC}"
  echo ""
  echo -e "${CYAN} 0${NC}) ${RED}Back${NC}"
  echo ""
}

select_ipv6_range() {
  while true; do
    print_ipv6_menu
    echo -ne "${GREEN}Select an option ${RED}[1-5]: ${NC}" 
    read option_ipv6

    case $option_ipv6 in
      1) 
      privateip6="fd1d:fc98:b73e:b481::1/64"; break ;;
      2) 
      privateip6="fd1d:fc98:b73e:b482::1/64"; break ;;
      3)                 
      privateip6="fd1d:fc98:b73e:b483::1/64"; break ;;
      4)                 
      privateip6="fd1d:fc98:b73e:b484::1/64"; break ;;
      5)
      echo ""
      echo ""
      color magenta "!!!WARNING!!!"
      color red "If you want to add more interface(wg.conf)"
      color red "they should NOT be the same IPv6 address"
      color red "For example,for wg0.conf: fd1d:fc98:b73e:b481::1/64 and for wg1.conf: fd1d:fc98:b73e:b481::2/64 and for wg2.conf: fd1d:fc98:b73e:b481::3/64, ...."
      echo
      echo -ne "${YELLOW}Enter your desire private ipv6 address ${GREEN}[e.g. fd1d:fc98:b73e:b481::1/64]: ${NC}"
      read privateipv6
      echo ""
      break
      ;;
      0) color red "Exiting..."; break ;;
      *) color red "Invalid option. Try again." ;;
    esac
  done
}

print_ipv6_menu() {
  printf "+---------------------------------------------+\n"
  echo -e "$MAGENTA$BOLD          Private IPv6 Interface ${NC}"
  printf "+---------------------------------------------+\n"
  echo ""
  color magenta "!!!WARNING!!!"
  color red "If you want to add more interface (wg0.conf, wg1.conf, wg2.conf,...)"
  color red "they should NOT be the same IPv6 subnet"
  color red "For example,for wg0.conf: fd1d:fc98:b73e:b481::1/64 and for wg1.conf: fd1d:fc98:b73e:b482::1/64 and for wg2.conf: fd1d:fc98:b73e:b483::1/64, ...."
  echo
  echo -e "${CYAN}  1. ${YELLOW}Range IP fd1d:fc98:b73e:b481::1/64${NC}"
  echo -e "${CYAN}  2. ${YELLOW}Range IP fd1d:fc98:b73e:b482::1/64${NC}"
  echo -e "${CYAN}  3. ${YELLOW}Range IP fd1d:fc98:b73e:b483::1/64${NC}"
  echo -e "${CYAN}  4. ${YELLOW}Range IP fd1d:fc98:b73e:b484::1/64${NC}"
  echo -e "${CYAN}  5. ${YELLOW}Enter custom private IPv4${NC}"
  echo ""
  echo -e "${CYAN} 0. ${RED}Back${NC}"
  echo ""
}

download_wireguard_panel() {
    FOLDER_NAME="WireguardPersian-old"

    echo -e "\033[93m────────────────────────────────────────────────\033[0m"
    echo -e "${GREEN}Downloading WireGuard panel...${NC}"

    if [ -d "$FOLDER_NAME" ]; then
        echo -e "${YELLOW}Removing existing $FOLDER_NAME...${NC}"
        rm -rf "$FOLDER_NAME"
    fi

    svn export https://github.com/Azumi67/WGDashboard_Persian/trunk/"$FOLDER_NAME"
    mv WireguardPersian-old WireguardPersian
}

install_start_wireguard_panel() {
    echo -e "\033[93m────────────────────────────────────────────────\033[0m"
    echo -e "${GREEN}Installing and starting WireGuard panel...${NC}"

    PANEL_DIR="WireguardPersian"
    SRC_DIR="/root/WireguardPersian/src/"
    WGD_SCRIPT="$SRC_DIR/wgd.sh"
    REQUIREMENTS_FILE="$SRC_DIR/requirements.txt"

    if [ ! -d "$PANEL_DIR" ]; then
        echo -e "${RED}Error: WireGuard panel directory not found. Please run download_wireguard_panel first.${NC}"
        exit 1
    fi

    cd "$SRC_DIR" || exit

    if [ ! -f "$WGD_SCRIPT" ]; then
        echo -e "${RED}Error: wgd.sh script not found.${NC}"
        exit 1
    fi

    chmod -R 755 /etc/wireguard
    pip install -r "$REQUIREMENTS_FILE"
    chmod +x wgd.sh && "./wgd.sh" install && "./wgd.sh" start
    sleep 3
    "./wgd.sh" restart
    print_status
    press_enter
}

uninstall() {
    root
    PANEL_DIR="WireguardPersian"
    SRC_DIR="/root/WireguardPersian/src/"
    WGD_SCRIPT="$SRC_DIR/wgd.sh"
    REQUIREMENTS_FILE="$SRC_DIR/requirements.txt"
    clear
    echo -e "\033[93m────────────────────────────────────────────────\033[0m"
    echo
    echo -e "${GREEN}Uninstalling WireGuard panel...${NC}"
    cd "$SRC_DIR" || exit

    if [ ! -f "$WGD_SCRIPT" ]; then
        echo -e "${RED}Error: wgd.sh script not found.${NC}"
        exit 1
    fi

    "./wgd.sh" stop

    if [ -d "/root/WireguardPersian" ]; then
        rm -rf "/root/WireguardPersian"
    fi

    apt-get purge -y subversion wireguard gunicorn python3-pip python3 git > /dev/null 2>&1
    apt-get autoremove -y > /dev/null 2>&1
    echo
    echo -e "${GREEN}WireGuard panel was uninstalled successfully.${NC}"
    press_enter
}

restart() {
  SRC_DIR="/root/WireguardPersian/src/"
  cd "$SRC_DIR" || exit

    if [ ! -f "$WGD_SCRIPT" ]; then
        echo -e "${RED}Error: wgd.sh script not found.${NC}"
        exit 1
    fi

    "./wgd.sh" restart
    print_status
    press_enter
}

print_status() {
clear
ipv4_address=$(wget -qO- https://ipinfo.io/ip)
ipv6_address=$(wget -qO- https://api64.ipify.org)

echo -e "${BLUE}+-----------------------------------------+${NC}"
echo
echo -e "${RED}TIP!!: ${GREEN}Enter the following link in your browser or http://ipv4_address:8080${NC}"
echo
echo -e "${YELLOW}WG dashboard:${GREEN}http://$ipv4_address:8080${NC}"
echo
echo -e "${YELLOW}WG dashboard:${GREEN}http://[$ipv6_address]:8080${NC}"
echo
echo -e "${BLUE}+-----------------------------------------+${NC}"
}

while true; do
  clear
  root
  title_text="WG-dashboard  Persian & English"
  echo && echo
  display_logo
  echo -e "$MAGENTA$BOLD             ${title_text} ${NC}"
  echo -e "${BLUE}+-----------------------------------------+${NC}"
  echo ""
  echo -e "${CYAN}  1. ${NC}Install and configure dashboard"
  echo -e "${CYAN}  2. ${NC}Add Extra wg.conf to dashboard"
  echo -e "${CYAN}  3. ${NC}Restart dashboard"
  echo -e "${CYAN}  4. ${NC}Uninstall dashboard"
  echo
  echo -e "${CYAN}     9. ${RED}OPtimizer-OPIran${NC}"
  echo -e "${CYAN}     0. ${RED}Exit${NC}"
  echo
  echo -e "${GREEN}Select an option ${RED}[1-3]: ${NC}   "
  read option

  case $option in
    9)
        bash <(curl -s https://raw.githubusercontent.com/opiran-club/VPS-Optimizer/main/optimizer.sh --ipv4)
        ;;
    1)
        update_system
        configure_wireguard
        download_wireguard_panel
        install_start_wireguard_panel
        ask_reboot
        ;;
    2)
        configure_wireguard
        ;;
    3)
        restart
        ;;
    4)
        uninstall
        ;;
    0)
        echo -e "${YELLOW}Exiting...${NC}"
        break
        ;;
    *)
        echo -e "${RED}Invalid option.${NC}"
        press_enter
        ;;
  esac
done