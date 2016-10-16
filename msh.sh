#!/usr/bin/env bash

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
Version='1.0'
Codename='Komodoku'

#msh config
srcfile="./msh.etc"
funfile="./msh.fun"
resfile="./.msh"
currlevel="1"
current=
currmenu="0"
choice=
title=
cmd=
redoflg=
dependflg=
status=
errmsg=
blank="          "

. $funfile

__showmenu(){
	clear
	banner=`awk '$1 ~ /^BANNER$/{print $2}' $srcfile`
	$banner

	prompt=`awk '$1 ~ /^PROMPT$/{print $2}' $srcfile`

	if [ $1 = "0" ]
	then
		expression="\$1 ~ /^.\$/"
	else
		expression="\$1 ~ /^$1-.\$/"
	fi

	awk -F"\t" -v BLANK="$blank" -v ETCFILE="$resfile" -v MENUID="$1" \
	'BEGIN{\
		while ( getline tracelog < ETCFILE == 1 ){\
			split(tracelog,menuid);\
			idstatus[menuid[1]]=menuid[2];\
		}\
	}\
	{ \
		if ('"$expression"'){ \
			if ($3!="submenu"){\
				sign="*";\
			}\
			else{\
				sign="";\
			}\
			if (idstatus[$1]=="OK"){\
				_status=" √";\
			}\
			else if (idstatus[$1]==""){\
				_status="";\
			}\
			else{\
				_status=" ✕";\
			}\
			print BLANK $1" "$2 sign _status; \
			lastid=$1;\
		} \
	}\
	END{\
		if ( idstatus[MENUID]=="" && idstatus[lastid]=="OK" ){\
			print MENUID "	OK" >> ETCFILE;
		}\
	}' $srcfile

	printf "${blank}q quit\n"
	printf "   $prompt: "
}

__getfunc(){
	__i=0
	title=
	cmd=
	redoflg=
	dependflg=

	__line=`awk -F"\t" '{ if ($1 ~ /^'"$current"'$/)print $0 }' $srcfile`
	for __p in ${__line// /}
	do
		__i=`expr $__i + 1`
		if [ $__i -eq 2 ] 
		then
			title=$__p
		elif [ $__i -eq 3 ] 
		then
			cmd=$__p
echo $cmd
		elif [ $__i -eq 4 ] 
		then
			redoflg=$__p
		elif [ $__i -eq 5 ] 
		then
			dependflg=$__p
		fi
	done
}

submenu(){
	currlevel=`expr $currlevel + 1`
	currmenu="$current"
}

__upmenu(){

	currlevel=`expr $currlevel - 1`

	if [ "$currlevel" = "1" ]
	then
		currmenu="0"
	else
		__len=`expr $currlevel \* 2 - 3`
		currmenu=`printf "%."$__len"s" $currmenu`
	fi
}

__getcmd(){

	read choice

	if [ "X$choice" = "Xq" ]
	then
		if [ "X$currlevel" = "X1" ]
		then
			cmd="QUIT"
		else
			cmd="__upmenu"
		fi
	else
		if [ "X$currlevel" = "X1" ]
		then
			current=$choice
		else
			__len=`expr $currlevel \* 2 - 3`
			current=`printf "%."$__len"s" $current`"-$choice"
		fi
		__getfunc
	fi
}

__cmdcheck(){

	if [ "X$cmd" = "Xsubmenu" -o "X$cmd" = "X__upmenu" ]
	then
		return 1
	fi

	__statuslist=`awk -F"\t" -v depend=$dependflg '{if ($1 == depend)print $2}' $resfile`
	__status=`echo $__statuslist | awk '{print $NF}'`

	if [ ! "X$dependflg" = "X" -a ! "X$__status" = "XOK" ]
	then
		errmsg=`echo "this step depends on [$dependflg] which is not executed or failed."`
		return 0
	fi

	__statuslist=`awk -F"\t" -v current=$current '{if ($1 == current)print $2}' $resfile`
	__status=`echo $__statuslist | awk '{print $NF}'`

	if [ "X$redoflg" = "XOK" -a "X$__status" = "XOK" ]
	then
		errmsg=`echo "this step can't be executed repeatly."`
		return 0
	fi

	return 1
}

__exec(){
	if [ ! "X$cmd" = "X" ]
	then
		__cmdcheck
		if [ $? -eq 1 ]
		then
			$cmd
			status=$?
			if [ $status -eq 0 ]
			then
				status="OK"
			fi

			if [ ! "X$cmd" = "Xsubmenu" -a ! "X$cmd" = "X__upmenu" ]
			then
				printf "%s	%s	%s\n" $current	$status	`date +%Y/%m/%d-%H:%M:%S` >> $resfile
				echo "press ENTER to return."
				read __a
			fi
		else
			echo "$errmsg"
			read __a
		fi
	fi
}

if [ ! -f $resfile ]
then
	> $resfile
fi

while true
do

	__showmenu $currmenu

	__getcmd

	if [ "X$cmd" = "XQUIT" ]
	then
		printf "${blank}quit(y/n)?"
		read __ok
		if [ "X$__ok" = "Xy" ]
		then
			break
		else
			continue
		fi
	elif [ "X$cmd" = "XE" ]
	then
		continue
	else
		__exec
	fi

done

rm -f $resfile
