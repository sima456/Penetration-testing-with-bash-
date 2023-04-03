#!/bin/sh
#!/bin/bash
#!/usr/bin/sh
#!/usr/bin/bash
#!/usr/bin/env sh
#!/usr/bin/env bash
#!/data/data/com.termux/files/usr/bin/sh
#!/data/data/com.termux/files/usr/bin/bash
###############################################################
#-Info--------------------------------------------------------#
#    Enter Your Target, Hack Him, and Get Markdown Report     #
#-About-------------------------------------------------------#
#--╼▰[ Skils ]-╼▰[ MultiMan ]                                 #
#--╼▰[ Part of ]-╼▰[ HacKingPro ]                             #
#--╼▰[ Script Name ]-╼▰[ HacKingPro-ChecKing ]                #
#--╼▰[ Author ]-╼▰[ AnLoMinus ]-╼▰[ Leon Yaakobov ]           #
###############################################################
# CREDIT: To All World Creators free Scripts & Tools          #
# BIG THANX TO ALL COMUNITY THAT SHARE ALL THAT FREE          #
# GREAT SCRIPTS                                               #
# Location: Made With LOVE IN ISRAEL !                        #
###############################################################
#-Metadata----------------------------------------------------#
#--╼▰[ Version ]-╼▰[ 1.0.0 ]                                  #
#--╼▰[ Source ]-╼▰[ https://github.com/AnLoMinus/HacKingPro ] #
#╼▰[ Created ]-╼▰[ 15-08-2022 ]-╼▰[ Update ]-╼▰[ 20-08-2022 ] #
###############################################################

#####################################
#------╼╼▰[ ChecKing ]--╼▰ [ Head ] #
#####################################
#--╼[ ChecKing ]--╼▰ [ System ]
Check_System(){
  #--╼[ ChecKing ]--╼▰ [ System ]--╼▰ [ Architecture ]
  case `dpkg --print-architecture` in
    darwin-amd64)
    SystemArchitecture="darwin-amd64" ;;
    aarch64)
    SystemArchitecture="arm64" ;;
    arm)
    SystemArchitecture="arm" ;;
    armhf)
    SystemArchitecture="armhf" ;;
    amd64)
    SystemArchitecture="amd64" ;;
    i*86)
    SystemArchitecture="i386" ;;
    x86_64)
    SystemArchitecture="amd64" ;;
    *)
    echo "Architecture Not Found"
    SystemArchitecture=" " ;;
  esac

  #--╼[ ChecKing ]--╼▰ [ System ]--╼▰ [ Package Manager ]
  echo "\n"
  if [ -e /data/data/com.termux/files/usr/bin/pkg ]; then
    MyPackManager="pkg"
    MySystem="Termux"
  elif [ $(command -v apk) ]; then
    MyPackManager="apk"
      MySystem="Android"
  elif [ $(command -v brew) ]; then
    MyPackManager="brew"
    MySystem="MacOS"
    sudo=""
  elif [ $(command -v apt-get) ]; then
    MyPackManager="apt-get"
    MySystem="Linux"
  elif [ $(command -v apt) ]; then
    MyPackManager="apt"
    MySystem="Linux"
  elif [ $(command -v yum) ]; then
    MyPackManager="yum"
    MySystem="Fedora"
  fi

  echo "    ${BCyan}${faintT}┌──${resetT}${BRed}[${DGrey} System ${BRed}]${faintT}${BCyan}───────────╼${resetT} ${BRed}[${DGrey} ${MySystem} ${BRed}]"

  #--╼[ ChecKing ]--╼▰ [ System ]--╼▰ [ root Access ]
  if [ $(command -v sudo) ]; then
    sudo="sudo"
  else
    sudo=""
  fi

  #--╼[ ChecKing ]--╼▰ [ System ]--╼▰ [ Home Dir ]
  if [ -d $HOME ]; then
    home=$HOME
  else
    home="~/"
  fi
  echo "    ${BCyan}${faintT}|──${resetT}${BRed}[${DGrey} Pack Manager ${BRed}]${faintT}${BCyan}─────╼${resetT} ${BRed}[${DGrey} ${MyPackManager} ${BRed}]"
  echo "    ${BCyan}${faintT}|──${resetT}${BRed}[${DGrey} Home dir ${BRed}]${faintT}${BCyan}─────────╼${resetT} ${BRed}[${DGrey} ${home} ${BRed}]"

  #--╼[ ChecKing ]--╼▰ [ System ]--╼▰ [ Bin Dir ]
  if [ -d /data/data/com.termux/files/usr/bin ]; then
    MyBinDirectory="/data/data/com.termux/files/usr/bin"
  elif [ -d /usr/local/bin ]; then
    MyBinDirectory="/usr/local/bin"
  elif [ -d /bin ]; then
    MyBinDirectory="/bin"
  elif [ -d /sbin ]; then
    MyBinDirectory="/sbin"
  fi
  echo "    ${BCyan}${faintT}└──${resetT}${BRed}[${DGrey} Bin Directory ${BRed}]${faintT}${BCyan}────╼${resetT} ${BRed}[${DGrey} ${MyBinDirectory} ${BRed}]"
  # cp $0 ${bin}

}
#--╼[ ChecKing ]--╼▰ [ If ]--╼▰ [  Program Exist ]
CheckThatPro(){
  if [ -z $1 ]; then
    echo "\n"
    echo "    ${LRed}|──╼${BRed}[${slowBlink} ❌ ${resetT}${BRed}]${LRed}──╼▰ ${BRed}[${LRed} Please Set Something To Find ${BRed}]"
    echo "\n"
  else
    which $1 > /dev/null 2>&1;
    if [ $? = 0 ]; then
      ToolPath=$(which $1)
      echo "    ${BCyan}${faintT}|──╼${resetT}${BRed}[ ✅ ]${BCyan}${faintT}──╼${resetT}${LGreen}╼▰ ${LCyan}[${ORANGE} ${1} ${LCyan}]${BCyan}${faintT}──╼${resetT}${LGreen}╼▰ ${BRed}[${BCyan} ${ToolPath} ${BRed}]"
    else
      echo "    ${BCyan}${faintT}|──╼${resetT}${BRed}[ ${slowBlink}❌${resetT}${BRed} ]${BCyan}${faintT}──╼${resetT}${LRed}╼▰ ${BWhite}[ ${1} ]${BCyan}${faintT}──╼${resetT}${LRed}╼▰ ${BRed}[ Sorry ${BRed}Not Found! ${BRed}]"
      AwesomeInstallPro ${1}
    fi
  fi
}
#--╼[ ChecKing ]--╼▰ [ Required Programs ]
CheckRequiredPro(){
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Main Menu ]
  AwesomeLine "🔶 ${HacKingPro} ChecKing Required Programs 🔶"
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ System Packs ]
  CheckRequired_SystemPack(){
    AwesomeLine "System Packs"
    MiniHeaderSta "System Pack"
    CheckThatPro ps
    CheckThatPro sh
    CheckThatPro su
    CheckThatPro top
    CheckThatPro git
    CheckThatPro zsh
    CheckThatPro apt
    CheckThatPro pip
    CheckThatPro pip2
    CheckThatPro pip3
    CheckThatPro sudo
    CheckThatPro bash
    CheckThatPro less
    CheckThatPro last
    CheckThatPro host
    CheckThatPro ping
    CheckThatPro open
    CheckThatPro dpkg
    CheckThatPro wget
    CheckThatPro whoami
    CheckThatPro figlet
    CheckThatPro python
    CheckThatPro python2
    CheckThatPro python3
    CheckThatPro apktool
    CheckThatPro tcpdump
    CheckThatPro netstat
    CheckThatPro openvpn
    CheckThatPro ifconfig
    CheckThatPro ipconfig
    CheckThatPro macchanger
    CheckThatPro enum4linux 
    MiniHeaderEnd "System Pack"
    Press_ENTER
  }
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Anonimity ]
  CheckRequired_Anonimity(){
    AwesomeLine "Anonimity"
    MiniHeaderSta "Anonimity "
    CheckThatPro i2p
    CheckThatPro tor
    MiniHeaderEnd "Anonimity"
    Press_ENTER
  }
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Reconnaissance & Information Gathering ]
  CheckRequired_Reconnaissance__Information_Gathering(){
    AwesomeLine "Reconnaissance & Information Gathering"
    MiniHeaderSta "Reconnaissance & Information Gathering "
    CheckThatPro ip
    CheckThatPro who
    CheckThatPro dig
    CheckThatPro arp
    CheckThatPro curl
    CheckThatPro nmap
    CheckThatPro dirb
    CheckThatPro amass
    CheckThatPro whois
    CheckThatPro nikto
    CheckThatPro wfuzz
    CheckThatPro tshark
    CheckThatPro kismet
    CheckThatPro dnsmap
    CheckThatPro sslyze
    CheckThatPro wpscan
    CheckThatPro dnswalk
    CheckThatPro dnsenum
    CheckThatPro whatweb
    CheckThatPro openvas
    CheckThatPro sslscan
    CheckThatPro arpspoof
    CheckThatPro joomscan
    CheckThatPro etherape
    CheckThatPro gobuster
    CheckThatPro nslookup
    CheckThatPro dnsrecon
    CheckThatPro beef-xss
    CheckThatPro SubFinder
    CheckThatPro Sublist3r
    CheckThatPro smbclient
    CheckThatPro wireshark
    CheckThatPro traceroute
    CheckThatPro metagoofil
    CheckThatPro netdiscover
    CheckThatPro theharvester
    MiniHeaderEnd "Reconnaissance & Information Gathering "
    Press_ENTER
  }
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Delivery ]
  CheckRequired_Delivery(){
    AwesomeLine "Delivery"
    MiniHeaderSta "Delivery "
    CheckThatPro ssh
    CheckThatPro ftp
    MiniHeaderEnd "Delivery "
    Press_ENTER
    }
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Exploitation ]
  CheckRequired_Exploitation(){
    AwesomeLine "Exploitation"
    MiniHeaderSta "Exploitation "
    CheckThatPro nc
    CheckThatPro rlwrap
    CheckThatPro sqlmap
    MiniHeaderSta "Metasploit Framework"
    CheckThatPro msfd
    CheckThatPro msfdb
    CheckThatPro msfrpc
    CheckThatPro msfvenom
    CheckThatPro msfconsole
    MiniHeaderEnd "Metasploit Framework"
    MiniHeaderEnd "Exploitation "
    Press_ENTER
  }
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ WiFi HacKing ]
  CheckRequired_WiFi_HacKing(){
    AwesomeLine "WiFi HacKing"
    MiniHeaderSta "WiFi HacKing"
    CheckThatPro wifite
    CheckThatPro airmon-ng
    CheckThatPro airbase-ng
    CheckThatPro aircrack-ng
    CheckThatPro airodump-ng
    CheckThatPro aireplay-ng
    CheckThatPro airdecap-ng
    CheckThatPro airdecloak-ng
    MiniHeaderEnd "WiFi HacKing"
    Press_ENTER
  }
  #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Main Menu ]
  while  true; do
    #statements
    ToolHeaderRun
    echo "
    #-[1]-╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ System Packs ]
    #-[2]-╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Anonimity ]
    #-[3]-╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Reconnaissance & Information Gathering ]
    #-[4]-╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Delivery ]
    #-[5]-╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Exploitation ]
    #-[6]-╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ WiFi HacKing ]
    "
    read cCC
    case $cmd in
      1 )
      #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ System Packs ]
      CheckRequired_SystemPack
      ;;
      2 )
      #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Anonimity ]
      CheckRequired_Anonimity
      ;;
      3 )
      #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Reconnaissance & Information Gathering ]
      CheckRequired_Reconnaissance__Information_Gathering
      ;;
      4 )
      #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Delivery ]
      CheckRequired_Delivery
      ;;
      5 )
      #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ Exploitation ]
      CheckRequired_Exploitation
      ;;
      6 )
      #--╼[ ChecKing ]--╼▰ [ Required Programs ]--╼▰ [ WiFi HacKing ]
      CheckRequired_WiFi_HacKing
      ;;
      x|X|exit|quit|Exit )
      cd ${MainDirectoriy}
      AwesomeLineExit
      break
      ;;
    esac
  done
  AwesomeLine "✅ ${HacKingPro} ChecKing Required Programs ✅"
}
#--╼[ ChecKing ]--╼▰ [ If ]--╼▰ [  Case Folder Exist ]
CheckingifCaseFolderExist(){
  #statements
  if [ -d Case ]; then
    echo "\n          ${BBlue}|────${BRed}[ ✅ ${BRed}]${BBlue}──╼ ${BGreen}Case ${BYellow}Folder Exists, Continue to it\n"
    cd Case
    if [ -d $targetNAME ]; then
      #statements
      echo "          ${BBlue}|────${BRed}[ ✅ ${BRed}]${BBlue}──╼ ${BGreen}$targetNAME ${BYellow}Folder Exists, Continue to it\n"
      cd ${targetNAME}
    else
      echo "\n          ${BBlue}|────${BRed}[ ❌ ${BRed}]${BBlue}──╼ ${BGreen}${targetNAME} ${BYellow}Folder Not Exists, Creating it\n"
      mkdir ${targetNAME}
      cd ${targetNAME}
    fi

    if [ -d Planning ]; then
      #statements
      echo "          ${BBlue}|────${BRed}[ ✅ ${BRed}]${BBlue}──╼ ${BGreen}$targetNAME/Planning ${BYellow}Folder Exists, Continue to it\n"
      cd Planning
    else
      echo "\n          ${BBlue}|────${BRed}[ ❌ ${BRed}]${BBlue}──╼ ${BGreen}Planning ${BYellow}Folder Not Exists, Creating it\n"
      mkdir Planning
      cd Planning
    fi
  else
    echo "\n          ${BBlue}|────${BRed}[ ❌ ${BRed}]${BBlue}──╼ ${BGreen}Case ${BYellow}Folder Not Exists, Creating it\n"
    echo "          ${BBlue}|────${BRed}[ ✅ ${BRed}]${BBlue}──╼ ${BYellow}Creating ${BGreen}Case ${BYellow}Folder and Continue to it\n"
    mkdir Case
    cd Case
    echo "          ${BBlue}|────${BRed}[ ✅ ${BRed}]${BBlue}──╼ ${BYellow}Creating ${BGreen}$targetNAME ${BYellow}and Continue to it\n"
    mkdir $targetNAME
    cd $targetNAME
    echo "          ${BBlue}|────${BRed}[ ✅ ${BRed}]${BBlue}──╼ ${BYellow}Creating ${BGreen}Case Planning ${BYellow}and Continue to it\n"
    mkdir Planning
    cd Planning
  fi

  if [ -e ${Planning_File} ]; then
    t5="$(echo "          ${BBlue}|────${BRed}[ ❌ ${BRed}]${BBlue}──╼${BGreen} $Planning_File ${BGreen} ${BYellow}Exist! ${LRed}Remove it? ${BCyan}[yY/nN]: ")"
    read -p "$t5 " filexist
    case $filexist in
      y|Y)
      cd "$MainDirectoriyCaseName/Planning"
      echo "          ${BBlue}|────${BRed}[ 🔶 ${BRed}]${BBlue}──╼${BGreen}  Removing {${Planning_File}} file .."
      Press_ENTER
      rm ${Planning_File}
      echo "          ${BBlue}|────${BRed}[ ❌ ${BRed}]${BBlue}──╼${BGreen} ✅ Removed {${Planning_File}} file .."
      cd "$MainDirectoriyCaseName"
      ;;
      n|N)
      echo "          ${BBlue}|────${BRed}[ 🔶 ${BRed}]${BBlue}──╼${BGreen} Leaving {${Planning_File}} file .."
      ;;
    esac
  fi

}
#--╼[ ChecKing ]--╼▰ [ If ]--╼▰ [ Internet Connection Exist ]
CheckInternetConnection(){
  ping -c 1 google.com > /dev/null 2>&1
  if [ "$?" == 0 ]; then
    InternetStatus="\n    ${DGrey}[✅${DGrey}]${BYellow}${faintT}──╼${resetT}${LGreen}▰▰▰  ${resetT}${DGrey}[${LGrey} Internet ${DGrey}]${BYellow}${faintT}───────╼${resetT}${LGreen}▰▰▰ ${DGrey}[${BGreen}${slowBlink} True ${resetT}${DGrey}] \n"
    echo "${InternetStatus}"
    if [ ! -z "$targetDns" ]; then
      #statements
      GetIP="$(ping -c 1 "${targetDns}" | grep ttl | cut -d " " -f4 |  tr  -d :)"
      targetIP="${GetIP}"
    fi
    clear

  else
    InternetStatus="\n    ${DGrey}[❌${DGrey}]${BYellow}${faintT}──╼${resetT}${LRed}▰▰▰  ${resetT}${DGrey}[${LGrey} Internet ${DGrey}]${BYellow}${faintT}───────╼${resetT}${LRed}▰▰▰ ${DGrey}[${BRed}${slowBlink} False ${resetT}${DGrey}] ${BRed}\n"
    echo "${InternetStatus}"
  fi
}
#--╼[ ChecKing ]--╼▰ [ If ]--╼▰ [ User is Root ]
CheckingIfRoot(){
  ROOT_UID=0
  if [ "$UID" -eq "$ROOT_UID" ]; then
    echo "Yes, you are root."
  else
    echo "No, you are not root"
  fi
}
#--╼[ ChecKing ]--╼▰ [ If ]--╼▰ [ IP = "" ]
Checking_IP_Target(){
  if [ -z $targetIP ]; then
    #statements
    clear
    # HacKingProLogo1
    ToolHeaderRun
    echo "

    ${DGrey}┌──${BRed}[${DGrey} P ${BRed}]${BYellow}╼▰  ${BRed}[${DGrey} ⚡️ Planning and Scoping 🎯 ${BRed}]
    ${DGrey}|
    ${DGrey}|──${BRed}[${DGrey} Full Time ${BRed}]${BYellow}╼▰  ${BRed}[${DGrey} $(date) ${BRed}]
    ${DGrey}|──${BRed}[${DGrey} Current Date ${BRed}]${BYellow}╼▰  ${BRed}[${DGrey} ${CurrentDate} ${BRed}]
    ${DGrey}|──${BRed}[${DGrey} Starting Time ${BRed}]${BYellow}╼▰  ${BRed}[${DGrey} ${StartingTime} ${BRed}]
    ${DGrey}|
    ${DGrey}|──${BRed}[ 🎯 ]${DGrey}──${BRed}[${DGrey}$(FunTargetIP)${BRed}]${DGrey}──╼  ${LRed}IP${BBlue}: ${BGreen}${targetIP}
    ${DGrey}|──${BRed}[ 🎯 ]${DGrey}──${BRed}[${DGrey}$(FunTargetDns)${BRed}]${DGrey}──╼  ${LRed}Dns${BBlue}: ${BGreen}${targetDns}
    ${DGrey}|──${BRed}[ 🎯 ]${DGrey}──${BRed}[${DGrey}$(FunTargetName)${BRed}]${DGrey}──╼  ${LRed}Name${BBlue}: ${BGreen}${targetNAME}
    ${DGrey}|──${BRed}[ 🎯 ]${DGrey}──${BRed}[${DGrey}$(FunTargetEmail)${BRed}]${DGrey}──╼  ${LRed}Email${BBlue}: ${BGreen}${targetEmail}
    ${DGrey}|──${BRed}[ 🎯 ]${DGrey}──${BRed}[${DGrey}$(FunTargetPhone)${BRed}]${DGrey}──╼  ${LRed}Phone${BBlue}: ${BGreen}${targetPhone}
    ${DGrey}|
    ${DGrey}└──${BRed}[${DGrey} CL ${BRed}]${BYellow}╼▰  ${BRed}[${DGrey} 🧹 Cleaning Target Variables  🧹 ${BRed}] "

    echo "\n    ${BGreen}[${BRed} ERROR ${BGreen}]${BRed}──╼ ${BGreen}[ ❌ ]${BRed}──╼  ${BGreen}[${BRed} You need Enter IP Before Scanning ${BGreen}] \n"
    sleep 1
    echo "    ${BGreen}┌──${BRed}[${slowBlink} P${resetT}${BRed} ]${BGreen}──╼ ${BRed}[ ⚡️ Planning and Scoping 🎯 ]"
    sleep 1
    echo "    ${BGreen}|──${BRed}[${slowBlink} P${resetT}${BRed} ]${BGreen}──╼ ${BRed}[ ⚡️ Planning and Scoping 🎯 ]"
    sleep 1
    echo "    ${BGreen}|──${BRed}[${slowBlink} P${resetT}${BRed} ]${BGreen}──╼ ${BRed}[ ⚡️ Planning and Scoping 🎯 ]"
    sleep 1
    echo "    ${BGreen}|──${BRed}[${slowBlink} P${resetT}${BRed} ]${BGreen}──╼ ${BRed}[ ⚡️ Planning and Scoping 🎯 ]"
    sleep 1
    echo "    ${BGreen}|──${BRed}[${slowBlink} P${resetT}${BRed} ]${BGreen}──╼ ${BRed}[ ⚡️ Planning and Scoping 🎯 ]"
    sleep 1
    echo "    ${BGreen}└──${BRed}[${slowBlink} P${resetT}${BRed} ]${BGreen}──╼ ${BRed}[ ⚡️ Planning and Scoping 🎯 ]"
    sleep 1
    Press_ENTER readthat
    cd "${MainDirectoriy}"
    break
  fi

}
####################################
#------╼╼▰[ ChecKing ]--╼▰ [ End ] #
####################################
