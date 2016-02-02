dot-files
=========
#### version: 0.4.1
---

I believe that I can (and should) improve other Linux users' skill set.

With this repo, I pretend to provide easy access to install new and valuable tools.

This is a traditional dot file repo as you can find more on [Github](https://dotfiles.github.io/).


---

### How to install:

##### Requires `sudo` permissions.
     1. sudo -s

     2. wget https://github.com/rGalrito/dot-files -O dot-files

     2. git clone https://github.com/rGalrito/dot-files
     
     3. cd && dot-files

     4. sh installer.sh

---

### *HOW IT WORKS:*

This script will prompt for several alternatives of useful programs / commands to install and will install them after the prompt.
This script could be split in two main parts: **Prompt** for programs and **Download and install** commands / programs.

##### **PROMPT:**

On Prompt, you will have several categories which you can choose to have access to different programs. Categories can be from Linux server utilities to general useful commands.

* E.g. if you use a server, you should definely use a firewall - I've added ufw for simple firewall config

* E.g. if you edit text on the terminal, maybe a cli text editor could be a solution (see both vim or emacs)

##### **DOWNLOAD AND INSTALL:**
In here, all programs are installed according to user's choices.

*logging:* Output logs can be found in the .zshinstaller

---


#### **POSSIBLE TODO LIST:**
- Add other tools (other than basic server and webdev), keep looking for more tools to auto download
- Set .bashrc and aliases
- Add smaller categories 
- Create a lock file
- Install from source
- Install DEs : gnome3, kde, , (lxde, lxqt, xfce), mate, 
- Install WM: i3, dwm, Enlightenment, Fluxbox
- Configuration management: puppet or chef 
- Terminator or other terminal emulators
- Prompt to choose: maybe an enter should be default to install a program, instead of y?
