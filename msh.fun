banner(){
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
}
fun1(){
    echo -ne "  What is your IP Target or Host: " ; tput sgr0
    read ip
    xterm -hold -fa monaco -fs 13 -bg black -e nmap  $ip
}
fun2(){
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
}
fun3(){
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV -T4 -O -F --version-light 1  $ip
}
fun4(){
        echo -ne "  What is your IP Target or Host: " ; tput sgr0
        read ip
        xterm -hold -fa monaco -fs 13 -bg black -e nmap nmap -sA $ip
}
fun5(){
      echo -ne "  What is your IP Target or Host: " ; tput sgr0
      read ip
			xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -P0 $ip
}
fun601(){
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
           	  read ip
          	  xterm -hold -fa monaco -fs 13 -bg black -e nmap --script broadcast-ping --script-args broadcast-ping.num_probes=5 $ip
}
fun602(){
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
           	  read ip
          	  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PS $ip
}
fun603(){
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PA $ip
}
fun604(){
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PU $ip
}
fun605(){
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap -sP -PE $ip
}
fun606(){
                  echo -n "  What is your IP Target or Host: " ; tput sgr0
                  read ip
                  xterm -hold -fa monaco -fs 13 -bg black -e nmap  -sP -PO --packet-trace $
}
fun701(){
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap --script firewall-bypass --script-args firewall-bypass.helper="ftp", firewall-bypass.targetport=22 $ip
}
fun702(){
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      nmap -sS -sU -T4 -A -v $ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-methods,http-trace --script-args http-methods.retest $ip
}
fun703(){
      echo -ne  $okegreen" What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script smtp-open-relay -v $ip
}
fun704(){
      echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
      read ip
      xterm nmap -sn $ip
      echo -e ""
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script smtp-strangeport $ip
}
fun705(){
      echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-phpself-xss,http-unsafe-output-escaping $ip
}
fun706(){
      echo -ne $okegreen " What is your IP Target or Host: "; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p25 –script smtp-enum-users $ip
}
fun707(){
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-slowloris --max-parallelism 300 $ip
}
fun708(){
      echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
      read ip
      xterm -hold -fa monaco -fs 13 -bg black -e nmap -p80 --script http-sql-injection $ip
}
fun801(){
       			echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        		  read ip
            echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
          		read port
       			xterm -hold -fa monaco -fs 13 -bg black -e nmap --script ftp-brute -p $port $ip
}
fun802(){
       			echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
        		  read ip
            echo -ne $okegreen " Open Port on Target or Host:  " ; tput sgr0
          		read port
       			xterm -hold -fa monaco -fs 13 -bg black -e nmap --script ftp-brute -p $port $ip
}
fun803(){
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script http-joomla-brute $ip
}
fun804(){
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap --script http-proxy-brute -p 8080 $ip
}
fun805(){
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script http-wordpress-brute $ip
}
fun806(){
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 143,993 --script imap-brute $ip
}
fun807(){
            echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
              read ip
            xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 27017 $ip --script mongodb-brute
}
fun808(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script metasploit-xmlrpc-brute -p 55553 $ip
}
fun809(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 8728 --script mikrotik-routeros-brute $ip
}
fun80A(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=mysql-brute $ip
}
fun80B(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script=mysql-enum $ip
}
fun80C(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script nessus-brute -p 1241 $ip
}
fun80D(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV --script=pop3-brute $ip
}
fun80E(){
             echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
               read ip
             xterm -hold -fa monaco -fs 13 -bg black -e nmap --script rtsp-url-brute -p 554 $ip
}
fun80F(){
              echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                read ip
              xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU -sS --script smb-brute.nse -p U:137,T:139
}
fun80G(){
              echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                read ip
              xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 25 --script smtp-brute $ip
}
fun80H(){
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               echo -ne $okegreen " Located Wordlist ? :  " ; tput sgr0
                 read wordlist
               xterm -hold -fa monaco -fs 13 -bg black -e nmap -sU --script snmp-brute $ip [--script-args snmp-brute.communitiesdb=$wordlist ]
}
fun80I(){
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               echo -ne $okegreen " Open Port on Target or Host (23):  " ; tput sgr0
                 read port
               xterm -hold -fa monaco -fs 13 -bg black -e  nmap -p $port --script telnet-brute --script-args userdb=myusers.lst,passdb=mypwds.lst,telnet-brute.timeout=8s $ip
}
fun80J(){
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               xterm -hold -fa monaco -fs 13 -bg black -e nmap --script vnc-brute -p 5900 $ip
}
fun80K(){
               echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
                 read ip
               xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 5222 --script xmpp-brute $ip
}
fun901(){
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -T4 -A -v $ip
}
fun902(){
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				nmap -sS -sU -T4 -A -v $ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -sU -T4 -A -v $ip
}
fun903(){
				echo -ne  $okegreen" What is your IP Target or Host: " ; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -p 1-65535 -T4 -A -v $ip
}
fun904(){
				echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -T4 -F $ip
}
fun905(){
				echo -ne  $okegreen" What is your IP Target or Host: "; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sV -T4 -O -F --version-light $ip
}
fun906(){
				echo -ne $okegreen " What is your IP Target or Host: "; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sn --traceroute $ip
}
fun907(){
				echo -ne $okegreen " What is your IP Target or Host: " ; tput sgr0
 				read ip
				xterm -hold -fa monaco -fs 13 -bg black -e nmap -sS -sU -T4 -A -v -PE -PP -PS80,443 -PA3389 -PU40125 -PY -g 53 --script "default or (discovery and safe)" $ip
}
funA01(){
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
}
funA02(){
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
}
funA03(){
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
}
funA04(){
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
}
funB(){
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
