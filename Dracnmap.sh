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
Version='1.3'
Codename='Notick'

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
# check urxvt if exists
      which xterm > /dev/null 2>&1
      if [ "$?" -eq "0" ]; then
      echo [✔]::[xterm]: installation found!;
else

   echo [x]::[warning]:this script require Nmap ;
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
	function brutense	() {
		clear
		echo -e $okegreen " "
		echo "   _  _  ___  ____    ____  ____  __  __  ____  ____ ";
		echo "  ( \( )/ __)( ___)  (  _ \(  _ \(  )(  )(_  _)( ___)";
		echo "   )  ( \__ \ )__)    ) _ < )   / )(__)(   )(   )__) ";
		echo "  (_)\_)(___/(____)  (____/(_)\_)(______) (__) (____)";
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
		    echo -n -e $red'  \033[4mScreetsec@NSE-BRUTE:\033[0m>> '; tput sgr0 #insert your choice
		      	read Brute
		             if test $Brute == '1'
		          	then
		          		echo
		          		echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		           		read ip
		              echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
		             	read port
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p $port --script afp-brute $ip
		          	elif test $Brute == '2'
		           		then
		           			echo
		           			echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		           			read ip
		                echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
		              	read port
		        				xterm -hold -fa monaco -fs 13 -bg black -e nmap -p $port $ip --script ajp-brute
		              elif test $Brute == '3'
		                then
		                echo
		                echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		                echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
		                read port
										xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU --script backorifice-brute $ip --script-args backorifice-brute.ports=$port
		              elif test $Brute == '4'
		                then
		                echo
		                echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		                xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 9160 $ip --script=cassandra-brute
		            elif test $Brute == '5'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=cics-enum -p 23 $ip
		              		elif test $Brute == '6'
		                	then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=cics-user-enum -p 23 $ip
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
											xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=citrix-brute-xml --script-args=userdb=$userdb,passdb=$passdb,ntdomain=$domain -p 80,443,8080 $ip
		              elif test $Brute == '8'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 2401 --script cvs-brute $ip
		              elif test $Brute == '9'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 2401 --script cvs-brute-repository $ip
		              elif test $Brute == '10'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap --script domcon-brute -p 2050 $ip
		              elif test $Brute == '11'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap --script dpap-brute -p 8770 $ip
		              elif test $Brute == '12'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 50000 --script drda-brute $ip
		              elif test $Brute == '13'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
		                	echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
		                  read port
		                	xterm -hold -fa monaco -fs 13 -bg black -e nmap --script ftp-brute -p $port $ip
		              elif test $Brute == '14'
		                then
		                	echo
		                	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                  read ip
											xterm -hold -fa monaco -fs 13 -bg black -e nmap --script http-form-brute -p 80 $ip
		          elif test $Brute == '15'
		       			then
		       				echo
		       				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		        		  read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-iis-short-name-brute $ip
		       		elif test $Brute == '16'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		            	echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
		              read port
		            	xterm -hold -fa monaco -fs 13 -bg black -e nmap --script http-brute -p $port $ip
		       		elif test $Brute == '17'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		            	xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script http-joomla-brute $ip
		       		elif test $Brute == '18'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		            	xterm -hold -fa monaco -fs 13 -bg black -e nmap --script http-proxy-brute -p 8080 $ip
		       		elif test $Brute == '19'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		            	xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script http-wordpress-brute $ip
		       		elif test $Brute == '20'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU -p 4569 $ip --script iax2-brute
		       		elif test $Brute == '21'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script informix-brute -p 9088 $ip
		       		elif test $Brute == '22'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU --script ipmi-brute -p 623 $ip
		       		elif test $Brute == '23'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script irc-brute -p 6667 $ip
		       		elif test $Brute == '24'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script irc-sasl-brute -p 6667 $ip
		       		elif test $Brute == '25'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=iscsi-brute $ip
		       		elif test $Brute == '26'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 389 --script ldap-brute --script-args ldap.base='"cn=users,dc=cqure,dc=net"' $ip
		  		elif test $Brute == '27'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 143,993 --script imap-brute $ip
		  		elif test $Brute == '28'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 11211 --script membase-brute
		  		elif test $Brute == '29'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script mmouse-brute -p 51010 $ip
		  		elif test $Brute == '30'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 27017 $ip --script mongodb-brute
		  		elif test $Brute == '31'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 445 --script ms-sql-brute --script-args mssql.instance-all,userdb=customuser.txt,passdb=custompass.txt $ip
		  		elif test $Brute == '32'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=mysql-brute $ip
		  		elif test $Brute == '33'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									nmap --script=mysql-enum $ip
		  		elif test $Brute == '34'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 27017 $ip --script mongodb-brute
		          elif test $Brute == '35'
		            then
		            	echo
		            	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script metasploit-msgrpc-brute -p 55553 $ip
		          elif test $Brute == '36'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script metasploit-xmlrpc-brute -p 55553 $ip
		           elif test $Brute == '37'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		             xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 8728 --script mikrotik-routeros-brute $ip
		           elif test $Brute == '38'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=nessus-xmlrpc-brute $ip
		           elif test $Brute == '39'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 12345 --script netbus-brute $ip
		           elif test $Brute == '40'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script nexpose-brute -p 3780 $ip
		           elif test $Brute == '41'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=nje-node-brute $ip
		           elif test $Brute == '42'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=nje-pass-brute --script-args=ohost='POTATO',rhost='CACTUS',sleep=5 -p 175 $ip
		           elif test $Brute == '43'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 9929 --script nping-brute $ip
		           elif test $Brute == '44'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		             	xterm -hold -fa monaco -fs 13 -bg black -e nmap --script nessus-brute -p 1241 $ip
		           elif test $Brute == '45'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 9390 --script omp2-brute $ip
		           elif test $Brute == '46'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=openvas-otp-brute $ip
		           elif test $Brute == '47'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script oracle-brute -p 1521 --script-args oracle-brute.sid=ORCL $ip
		           elif test $Brute == '48'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script oracle-brute-stealth -p 1521 --script-args oracle-brute-stealth.sid=ORCL $ip
		           elif test $Brute == '49'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=oracle-sid-brute -p 1521-1560 $ip
		           elif test $Brute == '50'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=pcanywhere-brute $ip
		           elif test $Brute == '51'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 5432 --script pgsql-brute $ip
		           elif test $Brute == '52'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=pop3-brute $ip
		           elif test $Brute == '53'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 6379 $ip --script redis-brute
		           elif test $Brute == '54'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 512 --script rexec-brute $ip
		           elif test $Brute == '55'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 513 --script rlogin-brute $ip
		           elif test $Brute == '56'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 2002 $ip --script rpcap-brute
		           elif test $Brute == '57'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 873 --script rsync-brute --script-args 'rsync-brute.module=www' $ip
		           elif test $Brute == '58'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		             	xterm -hold -fa monaco -fs 13 -bg black -e nmap --script rtsp-url-brute -p 554 $ip
		           elif test $Brute == '59'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU -p 5060 $ip --script=sip-brute
		           elif test $Brute == '60'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script socks-brute -p 1080 $ip
		           elif test $Brute == '61'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script svn-brute --script-args svn-brute.repo=/svn/ -p 3690 $ip
		           elif test $Brute == '62'
		             then
		             	echo
		             	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
									xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=tso-enum -p 23 $ip
		           elif test $Brute == '63'
		              then
		              echo
		              echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		              read ip
		              xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU -sS --script smb-brute.nse -p U:137,T:139
		            elif test $Brute == '64'
		              then
		              	echo
		              	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		              	xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 25 --script smtp-brute $ip
		            elif test $Brute == '65'
		               then
		               	echo
		               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		               	echo -ne $okegreen " Located Wordlist ? :  " ; tput sgr0
		                read wordlist
		               xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU --script snmp-brute $ip [--script-args snmp-brute.communitiesdb=$wordlist ]
		             elif test $Brute == '66'
		               then
		               	echo
		               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		               	echo -ne $okegreen " Open Port on Target or Host (23):  " ; tput sgr0
		                read port
		               	xterm -hold -fa monaco -fs 13 -bg black -e nmap -p $port --script telnet-brute --script-args userdb=myusers.lst,passdb=mypwds.lst,telnet-brute.timeout=8s $ip
		            elif test $Brute == '67'
		              then
		              	echo
		              	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
										xterm -hold -fa monaco -fs 13 -bg black -e nmap --script vtam-enum -p 23 $ip
		            elif test $Brute == '68'
		              then
		              	echo
		              	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
										xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 902 $ip --script vmauthd-brute
		             elif test $Brute == '69'
		               then
		               	echo
		               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		               	xterm -hold -fa monaco -fs 13 -bg black -e nmap --script vnc-brute -p 5900 $ip
		             elif test $Brute == '70'
		               then
		               	echo
		               	echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
		                read ip
		               	xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 5222 --script xmpp-brute $ip
		             elif test $Brute == '71'
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
