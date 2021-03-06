#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/mfitd.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='muayfitcoin/muayfitcoin'
# Display Name.
DAEMON_NAME='Muayfit Core'
# Coin Ticker.
TICKER='MFIT'
# Binary base name.
BIN_BASE='mfit'
# Directory.
DIRECTORY='.mfit'
# Conf File.
CONF='mfit.conf'
# Port.
DEFAULT_PORT=1188
# Explorer URL
EXPLORER_URL='http://142.93.162.83/'
# Amount of Collateral needed.
COLLATERAL=1000
# Cycle Daemon on first start.
DAEMON_CYCLE=1

# Tip Address
TIPS=''
# Dropbox Addnodes
DROPBOX_ADDNODES='po6435skmevi9kj'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='ev9a8cuzmf98ypz'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='us53omtgemg16jb'

# Multiple on single IP.
MULTI_IP_MODE=3
# Mini Monitor check masternode list.
MINI_MONITOR_MN_LIST=1
# Mini Monitor Status to check for.
MINI_MONITOR_MN_STATUS='4'
# Mini Monitor masternode count is a json string.
MINI_MONITOR_MN_COUNT_JSON=1

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "MFIT"

 ,.       ___      ___ ____  ____      __      ___  ___ _______ __ ___________
 \-'__   |"  \    /"  ("  _||_ " |    /""\    |"  \/"  /"     "|" ("     _   ")
/ o.__o___\   \  //   |   (  ) : |   /    \    \   \  (: ______)|  )__/  \\__/
\/_/ /.___/\\  \/.    (:  |  | . )  /' /\  \    \\  \/ \/    | |:  |  \\_ /
  ||\'   |: \.        |\\ \__/ //  //  __'  \   /   /  // ___) |.  |  |.  |
  | /    |.  \    /:  |/\\ __ //\ /   /  \\  \ /   /  (:  (    /\  |\ \:  |
  \_\    |___|\__/|___(__________|___/    \___)___/    \__/   (__\_|_) \__|

MFIT
}

# Discord User Info
# @mcarper#0918
# 401161988744544258
cd ~/ || exit
COUNTER=0
rm -f ~/___mn.sh
while [[ ! -f ~/___mn.sh ]] || [[ $( grep -Fxc "# End of masternode setup script." ~/___mn.sh ) -eq 0 ]]
do
  rm -f ~/___mn.sh
  echo "Downloading Masternode Setup Script."
  wget -4qo- gist.githack.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=$(( COUNTER + 1 ))
  if [[ "${COUNTER}" -gt 3 ]]
  then
    echo
    echo "Download of masternode setup script failed."
    echo
    exit 1
  fi
done

(
  sleep 2
  rm ~/___mn.sh
) & disown

(
# shellcheck disable=SC1091
# shellcheck source=/root/___mn.sh
. ~/___mn.sh
DAEMON_SETUP_THREAD
)
# shellcheck source=/root/.bashrc
. ~/.bashrc
stty sane

