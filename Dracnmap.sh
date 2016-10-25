#!/usr/bin/env bash

#============================================================================================================
#                               Dracnmap
#
#                       Welcome and dont disclaimer
#                     Dracnmap Author By Edo -maland-
#                 Tested On Kali Linux and Dracos
#       contact me in screetsec@gmail.com or screetsec@dracos-linux.org
#          OS Penetration From Indonesia : https://dracos-linux.org/
#============================================================================================================


#This colour
cyan='\e[0;36m'
green='\e[0;34m'
okegreen='\033[92m'
lightgreen='\e[1;32m'
white='\e[1;37m'
red='\e[1;31m'
yellow='\e[1;33m'
BlueF='\e[1;34m'


#Variable
Version='1.1'
Codename='Komodoku'

#Bebeku
if [[ $EUID -ne 0 ]]; then
	echo "ERROR! Run this script with root user!"
	exit 1
fi

resize -s 50 84 > /dev/null

###############################################
# Checking gaannss
###############################################
clear
echo -e $cyan ""
echo "             .-.____________________.-. "
echo "      ___ _.' .-----.    _____________|======+----------------+ "
echo "     /_._/   (      |   /_____________|      |      OOO       | "
echo "       /      '  _ ____/                     |  BOOOMM !!!!!! | "
echo "      |_      .\( \\                          |________________| "
echo "     .'  @-._/____// "
echo "   .'       |=== "
echo "   /        / "
echo "  /        | "
echo "  |        ' "
echo "  |         \ "
echo "   -._____./ "
echo ""
echo ""
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
  if [ "$?" != 0 ]

then

    echo [✔]::[Internet Connection]: DONE!;
    echo [x]::[warning]: This Script Needs An Active Internet Connection;
    sleep 2

else

    echo [✔]::[Internet Connection]: connected!;
    sleep 2
fi

# check apache if exists
      which nmap > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo [✔]::[ Nmap ]: installation found!;
else

   echo [x]::[warning]:this script require Nmap ;
   echo ""
   echo [!]::[please wait]: please install .... ;
   apt-get update
   apt-get install nmap
   echo ""
   sleep 2
   exit
fi
sleep 2






################################################
# OUTPUT FILE
################################################
function scanoutput() {
  echo -e $cyan " "
  clear
  echo "  "
  echo "                "
  echo -e $okegreen"                       /^--^\     /^--^\     /^--^\   $cyan"
  echo -e $okegreen"                       \____/     \____/     \____/   $cyan "
  echo -e $okegreen"                      /      \   /      \   /      \  $cyan"
  echo -e $okegreen"                     |        | |        | |        | $cyan "
  echo -e $okegreen"                      \__  __/   \__  __/   \__  __/  $cyan  MEONG MOEONG "
  echo " |^|^|^|^|^|^|^|^|^|^|^|^\ \^|^|^|^/ /^|^|^|^|^\ \^|^|^|^|^|^|^|^|^|^|^|^| "
  echo " | | | | | | | | | | | | |\ \| | |/ /| | | | | | \ \ | | | | | | | | | | | "
  echo " ########################/ /######\ \###########/ /####################### "
  echo " | | | | | | | | | | | | \/| | | | \/| | | | | |\/ | | | | | | | | | | | | "
  echo " |_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_|_| "
    echo -e $white " "
    echo -e $white"	[$okegreen"01"$white]$okegreen  OUTPUT SCAN IN XML FORMATS  "
    echo -e $white"	[$okegreen"02"$white]$okegreen  OUTPUT SCAN IN HTML FORMATS "
    echo -e $white"	[$okegreen"03"$white]$okegreen  OUTPUT SCAN IN NORMAL FORMATS  "
    echo -e $white"	[$okegreen"04"$white]$okegreen  OUTPUT SCAN IN GREPABLE FORMATS "
    echo -e $white"	[$okegreen"05"$white]$okegreen  BACK  "
    echo -e " "
    echo -n -e $red'  \033[4mScreetsec@Meoong:\033[0m>> '; tput sgr0 #insert your choice
             read DrS

           if test $DrS == '1'
               then
                 echo
        	 echo -ne $cyan"  Path Location: /Dracnmap/Output/"
                 echo
        	 echo -ne "  Name of Report:"
        	 read namafile
                 echo
                 echo -ne "  What is your IP Target or Host: "
                 read ip
                 echo
                 nmap -A -O -oX Output/$namafile.xml $ip
                 firefox Output/$namafile.xml
           elif test $DrS == '2'
        	then
                  echo
            	  echo -ne $cyan"  Path Location: /Dracnmap/Output/"
                  echo
            	  echo -ne "  Name of Report:"
            	  read namafile
                  echo
                  echo -ne "  What is your IP Target or Host: "
                  read ip
                  echo
                  nmap -A -O -oX Output/$namafile.xml $ip5
        	  xsltproc Output/$namafile.xml -o Output/$namafile.html
        	  firefox Output/$namafile.html
            elif test $DrS == '3'
        	  then
                  echo
                  echo -ne $cyan"  Path Location: /Dracnmap/Output/"
                  echo
                  echo -ne "  Name of Report:"
                  read namafile
                  echo
                  echo -ne "  What is your IP Target or Host: "
                  read ip
                  echo
                  nmap -F -oN Output/$namafile.txt $ip
                  nano Output/$namafile.txt
             elif test $DrS == '4'
        	  then
                  echo
                  echo -ne $cyan"  Path Location: /Dracnmap/Output/"
                  echo
                  echo -ne "  Name of Report:"
                  read namafile
                  echo
                  echo -ne "  What is your IP Target or Host: "
                  read ip
                  echo
                  nmap -F -oG Output/$namafile.grep $ip5
                  nano Output/$namafile.grep
              elif test $DrS == '5'
                  then
                	menu
       		  else
       			  	echo -e "  Incorrect Number"
        			fi
        			echo -n -e "  Back to Last Menu? ( Yes / No ) :"
       			read back
       			if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
       					then
       					clear
       					menu
       			elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
       					then
       					scanoutput
       			fi
       }



################################################
# NSE SCRIPT FOR BRUTEFORCE
################################################

function brutense	() {
clear
echo -e $okegreen " "
echo "   _  _  ___  ____    ____  ____  __  __  ____  ____ ";
echo "  ( \( )/ __)( ___)  (  _ \(  _ \(  )(  )(_  _)( ___)";
echo "   )  ( \__ \ )__)    ) _ < )   / )(__)(   )(   )__) ";
echo "  (_)\_)(___/(____)  (____/(_)\_)(______) (__) (____)";
echo "                                                   ";

    echo -e $white " "
    echo -e $white"	[$okegreen"01"$white]$cyan  ftp-brute  "
    echo -e $white"	[$okegreen"02"$white]$cyan  http-brute "
    echo -e $white"	[$okegreen"03"$white]$cyan  http-joomla-brute  "
    echo -e $white"	[$okegreen"04"$white]$cyan  http-proxy-brute "
    echo -e $white"	[$okegreen"05"$white]$cyan  http-wordpress-brute "
    echo -e $white"	[$okegreen"06"$white]$cyan  imap-brute "
    echo -e $white"	[$okegreen"07"$white]$cyan  mongodb-brute"
    echo -e $white"	[$okegreen"08"$white]$cyan  metasploit-xmlrpc-brute  "
    echo -e $white"	[$okegreen"09"$white]$cyan  mikrotik-routeros-brute "
    echo -e $white"	[$okegreen"10"$white]$cyan  mysql-brute  "
    echo -e $white"	[$okegreen"11"$white]$cyan  mysql-enum  "
    echo -e $white"	[$okegreen"12"$white]$cyan  nessus-brute "
    echo -e $white"	[$okegreen"13"$white]$cyan  pop3-brute "
    echo -e $white"	[$okegreen"14"$white]$cyan  rtsp-url-brute "
    echo -e $white"	[$okegreen"15"$white]$cyan  smb-brute "
    echo -e $white"	[$okegreen"16"$white]$cyan  smtp-brute  "
    echo -e $white"	[$okegreen"17"$white]$cyan  snmp-brute "
    echo -e $white"	[$okegreen"18"$white]$cyan  telnet-brute "
    echo -e $white"	[$okegreen"19"$white]$cyan  vnc-brute"
    echo -e $white"	[$okegreen"20"$white]$cyan  xmpp-brute "
    echo -e $white"	[$okegreen"21"$white]$cyan  Back "
    echo -e " "
    echo -n -e $red'  \033[4mScreetsec@NSE-BRUTE:\033[0m>> '; tput sgr0 #insert your choice
             read Brute

          if test $Brute == '1'
       			then
       			echo
       			echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        		  read ip
            echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
          		read port
       			xterm -hold -fa monaco -fs 13 -bg black -e nmap --script ftp-brute -p $port $ip
       		elif test $Brute == '2'
            then
            echo
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
              read port
            xterm -hold -fa monaco -fs 13 -bg black -e nmap --script http-brute -p $port $ip
       		elif test $Brute == '3'
            then
            echo
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script http-joomla-brute $ip
       		elif test $Brute == '4'
            then
            echo
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap --script http-proxy-brute -p 8080 $ip
       		elif test $Brute == '5'
            then
            echo
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script http-wordpress-brute $ip
       		elif test $Brute == '6'
            then
            echo
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 143,993 --script imap-brute $ip
          elif test $Brute == '7'
            then
            echo
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 27017 $ip --script mongodb-brute
          elif test $Brute == '8'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script metasploit-xmlrpc-brute -p 55553 $ip
           elif test $Brute == '9'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 8728 --script mikrotik-routeros-brute $ip
           elif test $Brute == '10'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=mysql-brute $ip
           elif test $Brute == '11'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=mysql-enum $ip
           elif test $Brute == '12'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script nessus-brute -p 1241 $ip
           elif test $Brute == '13'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=pop3-brute $ip
           elif test $Brute == '14'
             then
             echo
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script rtsp-url-brute -p 554 $ip
           elif test $Brute == '15'
              then
              echo
              echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                read ip
              xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU -sS --script smb-brute.nse -p U:137,T:139
            elif test $Brute == '16'
              then
              echo
              echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                read ip
              xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 25 --script smtp-brute $ip
            elif test $Brute == '17'
               then
               echo
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               echo -ne $okegreen " Located Wordlist ? :  " ; tput sgr0
                 read wordlist
               xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU --script snmp-brute $ip [--script-args snmp-brute.communitiesdb=$wordlist ]
             elif test $Brute == '18'
               then
               echo
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               echo -ne $okegreen " Open Port on Target or Host (23):  " ; tput sgr0
                 read port
               xterm -hold -fa monaco -fs 13 -bg black -e  nmap -p $port --script telnet-brute --script-args userdb=myusers.lst,passdb=mypwds.lst,telnet-brute.timeout=8s $ip
             elif test $Brute == '19'
               then
               echo
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               xterm -hold -fa monaco -fs 13 -bg black -e nmap --script vnc-brute -p 5900 $ip
             elif test $Brute == '20'
               then
               echo
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 5222 --script xmpp-brute $ip
             elif test $Brute == '21'
               then
                menu
             else
                 echo ""
                 echo -e $okegreen " Incorrect Number"
               fi
               echo ""
               echo ""
               echo -n -e $red " Back to Last Menu? ( Yes / No ) :"
             read back
             if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
                 then
                 clear
                 menu
             elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
                 then
                 brutense
             fi
        }



################################################
# PING PING BEBEB
################################################
function pingbebeb() {
  echo -e $okegreen " "
  clear
  echo " "
  echo "                "
  echo ""
  echo "          \|/  "
  echo "         .-*-   "
  echo "        / /|\     "
  echo "       _L_         "
  echo "     ,     .         "
  echo -e $okegreen" (\ /  O O  \ /)  $red ______ _______ _______ _______      __ __      "
  echo -e $okegreen"  \|    _    |/   $red |   __ \_     _|    |  |     __|    |  |  |     "
  echo -e $okegreen"    \  (_)  /     $red |    __/_|   |_|       |    |  |    |__|__|   "
  echo -e $okegreen"    _/.___,\_     $red |___|  |_______|__|____|_______|    |__|__|    "
  echo -e $okegreen"   (_/ alf \_)         "
    echo -e $white " "
    echo -e $white"	[$okegreen"01"$white]$cyan  BROADCAST PING  "
    echo -e $white"	[$okegreen"02"$white]$cyan  TCP SYN PING SCANS "
    echo -e $white"	[$okegreen"03"$white]$cyan  TCP ACK PING SCANS "
    echo -e $white"	[$okegreen"04"$white]$cyan  UDP PING SCANS "
    echo -e $white"	[$okegreen"05"$white]$cyan  ICMP PING SCANS "
    echo -e $white"	[$okegreen"06"$white]$cyan  IP PROTOCOL PING SCANS "
    echo -e $white"	[$okegreen"07"$white]$cyan  BACK  "
    echo -e " "
    echo -n -e $red'  \033[4mScreetsec@PING!:\033[0m>> '; tput sgr0 #insert your choice
             read DrS

           if test $DrS == '1'
        	  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
           	  read ip
          	  xterm -hold -fa monaco -fs 13 -bg black -e nmap --script broadcast-ping --script-args broadcast-ping.num_probes=5 $ip
                  pingbebeb
           elif test $DrS == '2'
               	  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
           	  read ip
          	  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PS $ip
                  pingbebeb
           elif test $DrS == '3'
                  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PA $ip
                  pingbebeb
            elif test $DrS == '4'
                  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PU $ip
                  pingbebeb
            elif test $DrS == '5'
            		then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PE $ip
                  pingbebeb
            elif test $DrS == '6'
               	  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap  -sP -PO --packet-trace $
                  pingbebeb
            elif test $DrS == '7'
              then
              menu
       			else
                echo ""
       			  	echo -e $okegreen " Incorrect Number"
        			fi
              echo ""
              echo ""
        			echo -n -e $cyan " Back to Last Menu? ( Yes / No ) :"
       			read back
       			if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
       					then
       					clear
       					menu
       			elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
       					then
       					pingbebeb
       			fi
       }



###############################################
# ZENMAP
###############################################
function zenmapscript() {
clear
clear
echo ""
echo -e $okegreen" ===================================================================="
echo -e $cyan""
echo "           +--^----------,--------,-----,--------^-, "
echo -e "           | $red |||||||||   --------      |         O "
echo -e $cyan"           +---------------------------^----------| "
echo -e $cyan"            \_,---------,---------,--------------' "
echo -e "              / $red"XXXXXX"$cyan /'|       /' "
echo -e "             / $red"XXXXXX"$cyan /   \    /' "
echo -e "            / $red"XXXXXX"$cyan / _______/ "
echo -e "           / $red"XXXXXX"$cyan / "
echo -e "           / $red"XXXXXX"$cyan / "
echo "           (________(   "
echo -e "            ------'        $red DOUBLE KILL !! GO GO GO !!  "
echo ""
echo -e $okegreen" ====================================================================="
echo -e $cyan "       Scanning Target with $red'advanced command  ( Zenmap Command )  "
echo -e $okegreen" ====================================================================="
echo ""
echo ""
  echo -e $white"	[$okegreen"01"$white]$cyan  ITENSE SCAN"
  echo -e $white"	[$okegreen"02"$white]$cyan  ITENSE SCAN + UDP "
  echo -e $white"	[$okegreen"03"$white]$cyan  ITENSE SCAN ALL TCP PORTS "
  echo -e $white"	[$okegreen"04"$white]$cyan  QUICK SCAN  "
  echo -e $white"	[$okegreen"05"$white]$cyan  QUICK SCAN PLUS PLUS "
  echo -e $white"	[$okegreen"06"$white]$cyan  QUICK TRACEROUT   "
  echo -e $white"	[$okegreen"07"$white]$cyan  COMPREHENSIVE SCAN [BEST]  "
  echo -e $white"	[$okegreen"08"$white]$cyan  BACK  "
	echo -e 	" "
  echo -n -e $red'  \033[4mScreetsec@Headshot:\033[0m>> '; tput sgr0 #insert your choice
      read Scanning
			if test $Scanning == '1'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -T4 -A -v $ip
			elif test $Scanning == '2'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				nmap -sS -sU -T4 -A -v $ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -sU -T4 -A -v $ip
			elif test $Scanning == '3'
				then
				echo
				echo -ne  $okegreen" What is your IP Target or Host: " ; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 1-65535 -T4 -A -v $ip
			elif test $Scanning == '4'
				then
				echo
				echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -T4 -F $ip
			elif test $Scanning == '5'
				then
				echo
				echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV -T4 -O -F --version-light $ip
			elif test $Scanning == '6'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: "; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sn --traceroute $ip
			elif test $Scanning == '7'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $ip
      			elif test $Scanning == '8'
        			then
        			menu
     			else
     			    echo ""
     			    echo -e $okegreen " Incorrect Number"
     			  fi
     			  echo ""
     			  echo ""
     			  echo -n -e $red " Back to Last Menu? ( Yes / No ) :"
     			read back
     			if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
     			    then
     			    clear
     			    menu
     			elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
     			    then
     			    zenmapscript
     			fi
 }

################################################
# PSCANNING FOR WEB SERVICE
################################################
function WebService() {
  clear
echo -e $cyan ""
echo ""
  echo -e $red " __      __      ___.       _________                  .__              ";
  echo "/  \    /  \ ____\_ |__    /   _____/ ______________  _|__| ____  ____  ";
  echo "\   \/\/   // __ \| __ \   \_____  \_/ __ \_  __ \  \/ /  |/ ___\/ __ \ ";
  echo " \        /\  ___/| \_\ \  /        \  ___/|  | \/\   /|  \  \__\  ___/ ";
  echo "  \__/\  /  \___  >___  / /_______  /\___  >__|    \_/ |__|\___  >___  >";
  echo -e $okegreen
  echo " -----------------------------------------------------------------------"
  echo ""
    echo -e $white"	[$okegreen"01"$white]$cyan  DETECTING WEB APPLICATION FIREWALLS  "
    echo -e $white"	[$okegreen"02"$white]$cyan  DETECTING POSSIBLE XST VULNERABILITIES "
    echo -e $white"	[$okegreen"03"$white]$cyan  DETECTING OPEN RELAYS "
    echo -e $white"	[$okegreen"04"$white]$cyan  DETECTING BACKDOOR SMTP SERVERS "
    echo -e $white"	[$okegreen"05"$white]$cyan  DETECTING CROSS SITE SCRIPTING VULNERABILITIES  "
    echo -e $white"	[$okegreen"06"$white]$cyan  ENUMERATING USERS IN AN SMTP SERVER "
    echo -e $white"	[$okegreen"07"$white]$cyan  DETECTING WEB SERVERS VULNERABLE TO SLOWLORIS DDOS  "
    echo -e $white"	[$okegreen"08"$white]$cyan  FINDING SQL INJECTION VULNERABILITIES  "
    echo -e $white"	[$okegreen"09"$white]$cyan  CHECK IP GEOLOCATION WITH NSE  "
    echo -e $white"	[$okegreen"10"$white]$cyan  GATHERING INFORMATION FROM WHOIS (NSE)  "
    echo -e $white"	[$okegreen"11"$white]$cyan  COLLECTING VALID EMAIL ADDRES  "
    echo -e $white"	[$okegreen"12"$white]$cyan  BACK  "
    echo -e " "
    echo -n -e $red'  \033[4mScreetsec@WebService:\033[0m>> '; tput sgr0 #insert your choice
    read Scanning
    if test $Scanning == '1'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap --script firewall-bypass --script-args firewall-bypass.helper="ftp", firewall-bypass.targetport=22 $ip
    elif test $Scanning == '2'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      nmap -sS -sU -T4 -A -v $ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-methods,http-trace --script-args http-methods.retest $ip
    elif test $Scanning == '3'
      then
      echo
      echo -ne  $okegreen" What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script smtp-open-relay -v $ip
    elif test $Scanning == '4'
      then
      echo
      echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
      read ip
      xterm nmap -sn $ip
      echo -e ""
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script smtp-strangeport $ip
    elif test $Scanning == '5'
      then
      echo
      echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-phpself-xss,http-unsafe-output-escaping $ip
    elif test $Scanning == '6'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: "; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p25 –script smtp-enum-users $ip
    elif test $Scanning == '7'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-slowloris --max-parallelism 300 $ip
    elif test $Scanning == '8'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-sql-injection $ip
		elif test $Scanning == '9'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -Pn -p80 --script ip-geolocation-* $ip
		elif test $Scanning == '10'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -sn --script whois-ip --script-args whois.whodb=nocache $ip
		elif test $Scanning == '11'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-google-email,http-email-harvest $ip
    elif test $Scanning == '12'
      then
      menu
    else
        echo ""
        echo -e $okegreen " Incorrect Number"
      fi
      echo ""
      echo ""
      echo -n -e $red " Back to Last Menu? ( Yes / No ) :"
    read back
    if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
        then
        clear
        menu
    elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
        then
        WebService
    fi
}


#######################################################
# CREDITS
#######################################################
function credits {
clear
echo -e "
\033[31m##########################################################################\033[m
		             Credits To
\033[31m##########################################################################\033[m"
echo
echo -e $white "Special thanks to:"
echo
echo -e $red "Dracos Linux ( www.dracos-linux.org )"
echo
echo -e $okegreen "Offensive Security for the awesome OS"
echo
echo -e $green "http://www.offensive-security.com/"
echo
echo -e $yellow "http://www.kali.org/"
echo
echo -e $cyan "http://www.kitploit.com/"
echo
echo -e $white "http://www.linuxsec.org/"
echo
echo -e $okegreen "My Friend for helpme ( Boy Suganda )"
echo
echo -e $red "Big Thanks to : http://www.github.com/"
echo

}

###################################################
# Function Menu
#####################################################
function menu() {
clear
echo -e $red ""
echo "             80G08        "
echo "                8G#G@8  "
echo "                  8##0  "
echo "                   0##G8    "
echo "                     ####08 "
echo "                      8#####8   "
echo "                        G#####8   "
echo "                         8G#####8   "
echo "      #8#########0         #######8   "
echo "          8#######0          0#88#####    "
echo "            8G####8         8 8#8@@8###   "
echo "               8###        G8   8@G######   "
echo "                8##88       8     8######8    "
echo "                  G##088          80G##G080   "
echo "                    88000000008880#      000    "
echo "                          9               0 "
echo -e $okegreen"    ######                                                   ";
echo "    #     # #####    ##    ####  #    # #    #   ##   #####  ";
echo "    #     # #    #  #  #  #    # ##   # ##  ##  #  #  #    # ";
echo "    #     # #    # #    # #      # #  # # ## # #    # #    # ";
echo "    #     # #####  ###### #      #  # # #    # ###### #####  ";
echo "    #     # #   #  #    # #    # #   ## #    # #    # #      ";
echo "    ######  #    # #    #  ####  #    # #    # #    # #      ";
echo ""
echo -e $cyan"    Script by           $white":" $red Edo Maland ( Screetsec ) "
echo -e $cyan"    Version             $white":" $red $Version  "
echo -e $cyan"    Codename            $white":" $red $Codename "
echo -e $cyan"    Follow me on Github $white":" $red @Screetsec "
echo -e $cyan"    Dracos Linux        $white":" $red dracos-linux.org "
echo -e $cyan ""
echo -e $okegreen"    =========================================================    ";
		echo -e $white " "
		echo -e $white"	[$okegreen"01"$white]$cyan  REGULER SCAN "
    echo -e $white"	[$okegreen"02"$white]$cyan  SCAN MULTIPLE IP ADDRESS "
		echo -e $white"	[$okegreen"03"$white]$cyan  SCAN OS VERSION AND TRACEROUTE "
    echo -e $white"	[$okegreen"04"$white]$cyan  FIND OUT IF A HOST IS PROTECTED FIREWALL  "
		echo -e $white"	[$okegreen"05"$white]$cyan  EVADING FIREWALLS "
    echo -e $white"	[$okegreen"06"$white]$cyan  PING PING !!   "
    echo -e $white"	[$okegreen"07"$white]$cyan  WEB SERVICES"
		echo -e $white"	[$okegreen"08"$white]$cyan  BRUTEFORCE WITH NSE SCRIPT   "
		echo -e $white"	[$okegreen"09"$white]$cyan  ADVANCED NMAP SCANNINGS ( ZENMAP COMMAND ) "
		echo -e $white"	[$okegreen"10"$white]$cyan  SCANNING TARGET WITH OUTPUT FILES"
		echo -e $white"	[$okegreen"11"$white]$cyan  CREDITS  "
		echo -e $white"	[$okegreen"12"$white]$cyan  EXIT  "
		echo -e " "
		echo -n -e $red'  \033[4mScreetsec@Dracnmap:\033[0m '; tput sgr0 #insert your choice
		read Dracnmap
		if test $Dracnmap == '1'
      then
    echo -e $cyan""
    echo -ne "  What is your IP Target or Host: " ; tput sgr0
    read ip
    xterm -hold -fa monaco -fs 13 -bg black -e nmap  $ip

		elif test $Dracnmap == '2'
 			then
    echo ""
    echo -ne $okegreen"  What is your IP Target or Host (1): " ; tput sgr0
    read ip1
    echo ""
    echo -ne $okegreen " What is your IP Target or Host (2): " ; tput sgr0
    read ip2
    echo ""
    echo -ne $okegreen " What is your IP Target or Host (3): " ; tput sgr0
    read ip3
    echo ""
    xterm -hold -fa monaco -fs 13 -bg black -e nmap  $ip1 $ip2 $ip3

		elif test $Dracnmap == '3'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV -T4 -O -F --version-light 1  $ip


		elif test $Dracnmap == '4'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        xterm -hold -fa monaco -fs 13 -bg black -e nmap nmap -sA $ip

		elif test $Dracnmap == '5'
			then
      echo -e $cyan""
      echo -ne "  What is your IP Target or Host: " ; tput sgr0
      read ip
			xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -P0 $ip

    elif test $Dracnmap == '6'
      then
      pingbebeb

		elif test $Dracnmap == '7'
			then
			WebService

		elif test $Dracnmap == '8'
 			then
 			brutense

		elif test $Dracnmap == '9'
 			then
      zenmapscript

		elif test $Dracnmap == '10'
	     then
       scanoutput

		elif test $Dracnmap == '11'
 			then
      credits

    elif test $Dracnmap == '12'
      then
        clear
        exit

 		else
			echo -e "  Incorrect Number"
			fi
			echo -n -e "  Do you want exit? ( Yes / No ) :"
			read back
			if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
					then
					clear
					exit
			elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
					then
					menu
  fi

}

####################################################
# BANNER
####################################################
clear
echo -e $red ""
echo "             80G08        "
echo "                8G#G@8  "
echo "                  8##0  "
echo "                   0##G8    "
echo "                     ####08 "
echo "                      8#####8   "
echo "                        G#####8   "
echo "                         8G#####8   "
echo "      #8#########0         #######8   "
echo "          8#######0          0#88#####    "
echo "            8G####8         8 8#8@@8###   "
echo "               8###        G8   8@G######   "
echo "                8##88       8     8######8    "
echo "                  G##088          80G##G080   "
echo "                    88000000008880#      000    "
echo "                          9               0 "
echo -e $okegreen"    ######                                                   ";
echo "    #     # #####    ##    ####  #    # #    #   ##   #####  ";
echo "    #     # #    #  #  #  #    # ##   # ##  ##  #  #  #    # ";
echo "    #     # #    # #    # #      # #  # # ## # #    # #    # ";
echo "    #     # #####  ###### #      #  # # #    # ###### #####  ";
echo "    #     # #   #  #    # #    # #   ## #    # #    # #      ";
echo "    ######  #    # #    #  ####  #    # #    # #    # #      ";
echo ""
echo -e $cyan"    Script by           $white":" $red Edo Maland ( Screetsec ) "
echo -e $cyan"    Version             $white":" $red $Version  "
echo -e $cyan"    Codename            $white":" $red $Codename "
echo -e $cyan"    Follow me on Github $white":" $red @Screetsec "
echo -e $cyan"    Dracos Linux        $white":" $red dracos-linux.org "
echo -e $cyan ""
echo -e $okegreen"    =========================================================    ";
		echo -e $white " "
		echo -e $white"	[$okegreen"01"$white]$cyan  REGULER SCAN "
    echo -e $white"	[$okegreen"02"$white]$cyan  SCAN MULTIPLE IP ADDRESS "
		echo -e $white"	[$okegreen"03"$white]$cyan  SCAN OS VERSION AND TRACEROUTE "
    echo -e $white"	[$okegreen"04"$white]$cyan  FIND OUT IF A HOST IS PROTECTED FIREWALL  "
		echo -e $white"	[$okegreen"05"$white]$cyan  EVADING FIREWALLS "
    echo -e $white"	[$okegreen"06"$white]$cyan  PING PING !!   "
    echo -e $white"	[$okegreen"07"$white]$cyan  WEB SERVICES"
		echo -e $white"	[$okegreen"08"$white]$cyan  BRUTEFORCE WITH NSE SCRIPT   "
		echo -e $white"	[$okegreen"09"$white]$cyan  ADVANCED NMAP SCANNINGS ( ZENMAP COMMAND ) "
		echo -e $white"	[$okegreen"10"$white]$cyan  SCANNING TARGET WITH OUTPUT FILES"
		echo -e $white"	[$okegreen"11"$white]$cyan  CREDITS  "
		echo -e $white"	[$okegreen"12"$white]$cyan  EXIT  "
		echo -e " "
		echo -n -e $red'  \033[4mScreetsec@Dracnmap:\033[0m '; tput sgr0 #insert your choice
		read Dracnmap
		if test $Dracnmap == '1'
      then
    echo -e $cyan""
    echo -ne "  What is your IP Target or Host: " ; tput sgr0
    read ip
    xterm -hold -fa monaco -fs 13 -bg black -e nmap  $ip

		elif test $Dracnmap == '2'
 			then
    echo ""
    echo -ne $okegreen"  What is your IP Target or Host (1): " ; tput sgr0
    read ip1
    echo ""
    echo -ne $okegreen " What is your IP Target or Host (2): " ; tput sgr0
    read ip2
    echo ""
    echo -ne $okegreen " What is your IP Target or Host (3): " ; tput sgr0
    read ip3
    echo ""
    xterm -hold -fa monaco -fs 13 -bg black -e nmap  $ip1 $ip2 $ip3

		elif test $Dracnmap == '3'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV -T4 -O -F --version-light 1  $ip


		elif test $Dracnmap == '4'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        xterm -hold -fa monaco -fs 13 -bg black -e nmap nmap -sA $ip

		elif test $Dracnmap == '5'
			then
      echo -e $cyan""
      echo -ne "  What is your IP Target or Host: " ; tput sgr0
      read ip
			xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -P0 $ip

    elif test $Dracnmap == '6'
      then
      pingbebeb

		elif test $Dracnmap == '7'
			then
			WebService

		elif test $Dracnmap == '8'
 			then
 			brutense

		elif test $Dracnmap == '9'
 			then
      zenmapscript

		elif test $Dracnmap == '10'
	     then
       scanoutput

		elif test $Dracnmap == '11'
 			then
      credits

    elif test $Dracnmap == '12'
      then
        clear
        exit

 		else
			echo -e "  Incorrect Number"
			fi
			echo -n -e "  Do you want exit? ( Yes / No ) :"
			read back
			if [ $back != 'n' ] && [ $back != 'N' ] && [ $back != 'no' ] && [ $back != 'No' ]
					then
					clear
					exit
			elif [ $back != 'y' ] && [ $back != 'Y' ] && [ $back != 'yes' ] && [ $back != 'Yes' ]
					then
					menu
fi
