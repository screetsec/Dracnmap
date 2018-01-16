#!/usr/bin/env bash

#============================================================================================================
#                         Dracnmap for dracos
#
#                      Welcome and dont disclaimer
#              Dracnmap Author By Edo -maland- a.k.a screetsec
#                     Tested On Kali Linux and Dracos
#       contact me in screetsec@gmail.com or screetsec@dracos-linux.org
#          OS Penetration From Indonesia : https://dracos-linux.org/
#============================================================================================================


################################################################################
######################## Global variables and functions ########################
################################################################################

# The arrays that store call parameters.
__init_params=()
__script_params=("$@")

# Color table.
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'

# Script info.
Version='2.1'
Codename='Redline'

readonly __cli_prompt="Screetsec@"
__cli_banner=""

# Store the name of the script and directory call.
readonly _init_name="$(basename "$0")"
readonly _init_directory="$(dirname "$(readlink -f "$0")")"

readonly _src_directory="${_init_directory}/src"

# Store functions (not modules).
readonly _functions_file="${_src_directory}/functions"

readonly _modules_directory="${_src_directory}/modules"

readonly _config_file="${_init_directory}/config"

readonly _modules_stack=("brutense" "auth" "brd" \
                         "exploit" "fuzzer" "malware" "vuln" "nse" \
                         "zenmapscript" "WebService" "pingbebeb")

# ``````````````````````````````````````````````````````````````````````````````
# Function name: _exit_()
#
# Description:
#   Covers the default exit command.
#
# Usage:
#   _exit_ value
#
# Examples:
#   _exit_ 0
#

function _exit_() {

  local _FUNCTION_ID="_exit_"
  local _STATE=0

  clear

  echo ""
  echo -e $yellow"[*] Thank You For Using Dracnmap  =)"
  echo ""
  echo -e $yellow"[*] Check Dracos Linux LFS, Penetration OS From Indonesia  =P"

  _STATUS="$1"
  exit "$_STATUS"

}

# ``````````````````````````````````````````````````````````````````````````````
# Function name: _get_trap_SIG()
#
# Description:
#   Ensuring they always perform necessary cleanup operations,
#   even when something unexpected goes wrong.
#
# Usage:
#   trap _get_trap_SIG SIGNAL
#
# Examples:
#   trap _get_trap_SIG EXIT
#

function _get_trap_SIG() {

  local _FUNCTION_ID="_get_trap_SIG"
  local _STATE="${_STATUS:-}"

  local _signal="$1"

  if [[ "$_signal" == "EXIT" ]] ; then

    _STATE=0

  elif [[ "$_signal" == "SIGS" ]] ; then

    _nmap_processes=($(pidof nmap))

    if [[ ${#_nmap_processes[@]} -ne 0 ]] ; then

      _STATE=0

    else

      _STATE=130

    fi

  else

    _STATE=0

  fi

  if [ -z "$_STATE" ] ; then _STATE=255 ; fi

  return $_STATE

}


################################################################################
######################### Main function (script init) ##########################
################################################################################

function __main__() {

  local _FUNCTION_ID="__main__"
  local _STATE=0

  # Bebeku
  if [[ $EUID -ne 0 ]]; then

   echo "ERROR! Run this script with root user!"
   exit 1

  fi

  if [ -z "${DISPLAY:-}" ]; then

    echo -e "\e[1;31mThe script should be executed inside a X (graphical) session."$transparent""
    exit 1

  fi
  resize -s 50 84 > /dev/null

  # Load modules, functions and config file.
  for _filename in "$_functions_file" "${_modules_stack[@]}" "$_config_file" ; do

    if [[ "$_filename" == *"/functions"* ]] ; then

      _mpath="$_filename"

    elif [[ "$_filename" == *"/config"* ]] ; then

      _mpath="$_filename"

    else

      _mpath="${_modules_directory}/${_filename}"

    fi

    if [[ ! -z "$_mpath" ]] && [[ -e "$_mpath" ]] ; then

      # If the file exists is loaded.
      . "$_mpath"

    elif [[ -z "$_mpath" ]] ; then

      printf "incorrectly loaded '$_mpath' file (incorrect filename)"
      exit 1

    else

      printf "incorrectly loaded '$_mpath' file (does not exist?)"
      exit 1

    fi

  done

  ###############################################
  # Checking gaannss
  ###############################################
  clear
  echo -e $okegreen ""
  echo -e $okegreen "    .___                     _______                         $red       ________  ";
  echo -e $okegreen "  __| _/___________    ____  \      \   _____ _____  ______  $red ___  _\_____  \ ";
  echo -e $okegreen " / __ |\_  __ \__  \ _/ ___\ /   |   \ /     \\__  \ \____  \ $red \  \/ //  ____/  ";
  echo -e $okegreen "/ /_/ | |  | \// __ \\  \___/     |    \  Y Y  \/ __ \|  |_> >$red  \   //       \  ";
  echo -e $okegreen "\____ | |__|  (____  /\___  >____|__  /__|_|  (____  /   __/ $red/\ \_/ \_______ \ ";
  echo -e $okegreen "     \/            \/     \/        \/      \/     \/|__|    $red\/             \/ ";
  echo
  echo -e $okegreen"-------------------------------------------------------------------------------"
  echo -e $lightgreen'-- -- +=[(c) 2016-2017 | dracos-linux.org | Linuxsec.org | Pentester Indonesia '
  echo -e $cyan'-- -- +=[ Author: Screetsec < Edo Maland >  ]=+ -- -- '
  echo -e " "

  if [ $(id -u) != "0" ]; then

    echo [!]::[Check Dependencies] ;
    sleep 2
    echo [✔]::[Check User]: $USER ;
    sleep 1
    echo [x]::[not root]: you need to be [root] to run this script.;
    echo ""
    sleep 1

    exit

  else

    echo [!]::[Check Dependencies]: ;
    sleep 1
    echo [✔]::[Check User]: $USER ;

  fi

  ping -c 1 google.com > /dev/null 2>&1
  if [ "$?" != 0 ] ; then

    echo [✔]::[Internet Connection]: DONE!;
    echo [x]::[warning]: This Script Needs An Active Internet Connection;
    sleep 2

  else

    echo [✔]::[Internet Connection]: connected!;
    sleep 2

  fi

  # Check nmap if exists.
  which nmap > /dev/null 2>&1
  if [ "$?" -eq "0" ]; then

    echo [✔]::[nmap]: installation found!;

  else

    echo [x]::[warning]:this script require Nmap ;
    echo ""
    echo [!]::[please wait]: please install .... ;
    apt-get update
    apt-get install nmap
    echo ""
    sleep

    exit

  fi
  sleep 2

  # Init menu.
  menu

  # Init Dracnmap CLI.
  _init_cli

}

trap "_get_trap_SIG EXIT" EXIT
trap "_get_trap_SIG SIGS" SIGHUP SIGTERM SIGKILL SIGINT

# An array as an argument to a function call __main__,
# is required if we want to operate on arguments of type $1, $2, ...
__main__ "${__script_params[@]}"

_exit_ 0
