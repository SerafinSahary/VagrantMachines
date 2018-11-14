#!/bin/bash

echo -n "updating /root/.bashrc..."

sed -e '/#force_color_prompt=yes/s/^#//' -i /root/.bashrc
sed -e '/PS1=/s/32m/31m/' -i /root/.bashrc

sed -e '/HISTSIZE/s/^/#/' -i /root/.bashrc
sed -e '/HISTFILESIZE/s/^/#/' -i /root/.bashrc

cat >> /root/.bashrc <<- "EOF"

# automatic config by Ser@fin
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

set -o vi

HISTSIZE=5000
HISTFILESIZE=5000
HISTTIMEFORMAT="%Y-%m-%d %H:%M > "

EOF
echo "done."

#

echo -n "updating /root/.vimrc..."
cat >> /root/.vimrc <<- "EOF"
" automatic config by Ser@fin
syntax on
set tabstop=8
set softtabstop=2
set shiftwidth=2
set noautoindent
set nowrap
set modeline

EOF
echo "done."

#

#echo -n "updating $HOME/.screenrc..."
#cat >> $HOME/.screenrc <<- "EOF"
#
## automatic config by Ser@fin
#hardstatus alwayslastline
#hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{=kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B}%Y-%m-%d %{W}%c:%s%{g}]'
#
#EOF
#echo "done."

#

echo -n "updating /etc/profile.d/.screenrc..."
cat >> /root/.screenrc <<- "EOF"

# automatic config by Ser@fin
hardstatus alwayslastline
hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{=kw}%?%-Lw%?%{r}(%{W}%n*%f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B}%Y-%m-%d %{W}%c:%s%{g}]'

EOF
echo "done."

#

echo -n "updating /etc/profile.d/tmout.sh..."
cat >> /etc/profile.d/tmout.sh <<- "EOF"

TMOUT=1800

EOF
echo "done."

#

chmod -v o-r / /etc /home /var /var/log


