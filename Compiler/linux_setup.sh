#!/bin/sh

#--------------------------------COLORS--------------------------------
RED="\033[0;31m"
BLACK="\033[0;30m"
RED="\033[0;31m"
GREEN="\033[0;32m"
BROWN_ORANGE="\033[0;33m"
BLUE="\033[0;34m"
PURPLE="\033[0;35m"
CYAN="\033[0;36m"
LIGHT_GRAY="\033[0;37m"
DARK_GRAY="\033[1;30m"
LIGHT_RED="\033[1;31m"
LIGHT_GREEN="\033[1;32m"
YELLOW="\033[1;33m"
WHITE="\033[1;37m"
LIGHT_BLUE="\033[1;34m"
LIGHT_PURPLE="\033[1;35m"
LIGHT_CYAN="\033[1;36m"
NO_COLOR="\033[0m"

#-----------------------------INSTALLATION-----------------------------
# Installing Python 3
echo "${GREEN}Installing Python 3${LIGHT_GRAY}"
sudo apt-get install python3
echo "${LIGHT_GREEN}Done${LIGHT_GRAY}"

# Installing Qt5 Designer Tools
echo "${GREEN}Installing Qt5 Designer Tools${LIGHT_GRAY}"
sudo apt-get install pyqt5-dev-tools
sudo apt-get install qttools5-dev-tools
echo "${LIGHT_GREEN}Done${LIGHT_GRAY}"

# Installing PyQt5
echo "${GREEN}Installing PyQt5${LIGHT_GRAY}"
sudo apt-get install python3-pyqt5
echo "${LIGHT_GREEN}Done${LIGHT_GRAY}"
