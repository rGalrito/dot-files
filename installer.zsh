#!/bin/sh
# 10 Jan 2016
# Rafael Galrito
# 
# I believe that I can improve some Linux users daily life (as well as for myself).
# 
# With this script, I pretend to provide easy access to install new and valuable tools.
# 
# requires sudo permissions
# run with sh zsh_installer.sh
#

######
# HOW It WORKS:
# This script will prompt for several alternatives of useful programs/commands to install and will install them.
#
# This script is divided in two main parts: "Prompt" for programs and "Download and install" said programs.
# 
# PROMPT:
# In Prompt you will have several categories which you can choose to have access to different programs
# E.g. if you use a server, you should definely use a firewall - I've added ufw for simple firewall config
# E.g. if you edit text on the terminal, maybe a cli text editor could be a solution (see both vim or emacs)
#
# DOWNLOAD AND INSTALL:
# In here, all programs are installed acording user's choices
#
# You can also find the output logs in .zshinstaller

# logging system
LOG_FILE=~/.zshinstaller

# clear screen
clear

# Welcome message introducing this script
echo "This is an installer for the best programs you can have access to on a Debian-based distro."
echo ""
echo "STILL IN DEVELOPMENT: Feel free to suggest a feature or report any bug at https://gist.github.com/rGalrito/22db3fa7032dfbe363c7"
echo ""
echo "This script is developed by Rafael Galrito (@rGalrito)"
echo "You can find this installation log in $LOG_FILE"

{
echo ""
echo "------------------"`date`"------------------" 
sleep 0.1

# FUNCTIONS

# install_package lowercases the first argument and tests if it is equal to Y or y
# outputs y or n
# Usage: var=$(install_packare $var)
install_package()
{
	[ ! -z $1 ] && (local temp=$(echo $1| tr "[:upper:]" "[:lower:]") && [ $temp = 'y' ] && echo 'y') || echo 'n'
}

# PROMPT 
# Download and install z shell (zsh)
read -p "Install zsh? (best shell) (y/n) " zsh
case $zsh in 
	[Yy]* ) 
		# Download and install oh-my-zsh
		read -p "Install oh-my-zsh? (zsh framework) (y/n) " omzsh
		case $omzsh in 
			# Download and install custom .zsh file from 
			[Yy]* )  read -p "Install custom .zsh file (y/n)? " ran;;
		esac
;;
esac


### Basic linux tools
read -p "Install basic cli tools? (vim, ranger, htop, tmux) (y/n) " li
li=$(install_package $li)

if [ $li = 'y' ]; then

	# Download an install vim
	read -p "Install vim (text editor)?  (y/n) " vi
	
	# Download an install vim
	read -p "Install emacs (text editor)?  (y/n) " emacs

	# Download an install ranger
	read -p "Install ranger (file explorer)? (y/n) " ran

	# Download an install mc 
	# read -p "Install mc (file explorer)? (y/n) " mc

	# Download an install atop
	# read -p "Install atop? (y/n) " atop

	# Download an install htop
	read -p "Install htop? (y/n) " htop

	# Download an install screen

	# Download an install tmux
	read -p "Install tmux (terminal multiplexer)? (y/n) " tm

	# Download and install thefuck
	read -p "Install thefuck (see: https://github.com/nvbn/thefuck)? (y/n) " tf

	# Download at
	read -p "Install at (command on specific time)?  (y/n) " at

	# Download watch
	read -p "Install watch (command on specific time)? (y/n) " wat

	# Download ag
	# read -p "Install ag? (ultrafast find tool) (y/n) " ag
	
	# Download ufw
	# read -p "Install ufw? (uncomplicated firewall) (y/n) " ufw
	
	# Download rtorrent
	# read -p "Install rtorrent? (y/n) " ufw

	# Download sshutle (works as vpn/proxy)
	# read -p "Install sshutle? (vpn/proxy see: ) (y/n) " ufw

	# Download cmus
	# read -p "Install cmus? (y/n)" cmus

	# Download and install nmap
	# 

	# Download and install terminator
	# Download and install sed
	# Download and install gawk

	# mutt
	# gpg
	# apline
	# python

fi


# Web development tools
read -p "Install web dev tools (prompt will follow)? (y/n) " wdt
if [ $wdt = 'y' ]; then
		# Download and install apache
		read -p "Install apache2? (y/n) " ap
		
		# Download and install ruby

		# Download and install nodejs
		read -p "Install nodejs? (y/n) " njs

		# Download and install mysql
		read -p "Install mysql? (y/n) " mys
		# mysql-server libapache2-mod-auth-mysql


		# Download and install workbench
		read -p "Install mysql-workbench? (y/n) " mbe

		# Download and install php dependencies
		# php5
		# php5 libapache2-mod-php5 php5-mcrypt
		# php5-mysql php5-curl php5-gd php5-intl php-pear php5-imagick php5-imap php5-mcrypt php5-memcache php5-ming php5-ps php5-pspell php5-recode php5-snmp php5-sqlite php5-tidy php5-xmlrpc php5-xsl
		# php5-cgi
		# php5-mysqlnd
		# php5-dbg 

		# Download and install sublime		
		read -p "Install sublime text 3? (y/n) " st


		# Download and install sc (spreadcheat)

fi


# Metasploit

# Vagrant


#apt loading

### Installations

# Update apt-get
echo "UPDATING APT-GET" && sudo apt-get update > /dev/null
zsh=$(install_package $zsh)
ohzsh=$(install_package $ohzsh)

[ $zsh = 'y' ] && ([ -d `which zsh` ] && echo "INSTALLING ZSH" && sudo apt-get install -y zsh || echo "ZSH ALREADY INSTALLED")\
 &&	[ $ohzsh = 'y' ] && ([ -d "~/.oh-my-zsh" ] && echo "INSTALLING OH-MY-ZSH" && sudo curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh - || echo "OH-MY-ZSH ALREADY INSTALLED")

# Downloads .zshrc (z shell config files)
# @TODO: Should retrieve export PATH from .zshrc and add to definitions
# wget -O ~/.zshrc   https://gist.github.com/rGalrito/b4304b2686c31b774c3a

# installing zsh-highlight-syntax
# echo "INSTALLING ZSH-HIGHLIGHT-SYNTAX"
# https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#with-oh-my-zsh
# zhs=$(install_package $zhs)
# [ $zhs = 'y'] && ([ -d `.oh-my-zsh/plugins/custom/zsh-syntax-highlight` ] && echo "INSTALLING ZSH-HIGHLIGHT-SYNTAX" && echo "missing installer for zsh hightlight syntax" || echo "THEFUCK ALREADY INSTALLED")

tf=$(install_package $tf)
[ $tf = 'y' ] && ([ -d `which thefuck` ] && echo "INSTALLING THEFUCK" && wget -O - https://raw.githubusercontent.com/nvbn/thefuck/master/install.sh | sh - && $0 || echo "THEFUCK ALREADY INSTALLED")

vi=$(install_package $vi)
[ $tf = 'y' ] &&  ([ -d `which vim` ] && sudo apt-get install -y vim || echo "VIM ALREADY INSTALLED")

ran=$(install_package $ran)
[ $ran = 'y' ] && ([ -d `which ranger` ] && sudo apt-get install -y ranger || echo "RANGER ALREADY INSTALLED")

ht=$(install_package $ht)
[ $ht = 'y' ] && ([ -d `which htop` ] && sudo apt-get install -y htop || echo "HTOP ALREADY INSTALLED")

tm=$(install_package $tm)
[ $tm = 'y' ] && ([ -d `which tmux` ] && sudo apt-get install -y tmux || echo "TMUX ALREADY INSTALLED")

#Web Dev tools
ap=$(install_package $ap)
[ $ap = 'y' ] && ([ -d `which apache2` ] && echo "INSTALLING APACHE2" && sudo apt-get install -y apache2 || echo "APACHE2 ALREADY INSTALLED")

njs=$(install_package $njs)
[ $njs = 'y' ] && ([ -d `which nodejs` ] && curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && sudo apt-get install -y nodejs || echo "NODEJS ALREADY INSTALLED")

mys=$(install_package $mys)
[ $mys = 'y' ] && ([ -d `which mysql` ] && echo "INSTALLING MYSQL" && sudo apt-get install -y mysql-common mysql-server mysql-client || echo "MYSQL ALREADY INSTALLED")

mbe=$(install_package $mbe)
[ $mbe = 'y' ] && ([ -d `which mysql-workbench` ] && echo "INSTALLING MYSQL-WORKBENCH" && sudo apt-get install -y mysql-workbench || echo "MYSQL-WORKBENCH ALREADY INSTALLED") 

# Get processor bit version
[ `uname --processor` = 'x86_64' ]  && proc_ver=amd64
[ `uname --processor` = 'i386' ]    && proc_ver=i386
[ `uname --processor` = 'i686' ]    && proc_ver=i386

st=$(install_package $st)
# Have to test the proc_ver variable 
[ $st = 'y' ] && ![ proc_ver = ""] && ([ -d `which subl` ] && echo "INSTALLING SUBLIME TEXT 3 ($proc_ver) versionION" && (wget "http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_$proc_ver.deb"; sudo dpkg -i sublime-text_build-3083_$proc_ver.deb; rm sublime-text_build-3083_$proc_ver.deb) || echo "SUBLIME TEXT 3 ALREADY INSTALLED")

if [ $zsh = 'y' ]; then 
	read -p "All installation were done. Do you want to change shell to zsh? (y/n) " ch

	ch=$(install_package $ch)
	[ $ch = 'y' ] && chsh -s `which zsh` && echo "SHELL CHANGE TO Z SHELL (zsh)"
else
	echo "All installations were done."
fi

} | tee -a $LOG_FILE

echo "SEE LOG FILE: cat $LOG_FILE \n\r"
