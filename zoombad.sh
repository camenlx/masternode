#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2018
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/zoombad.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='zoombacoin/zoomba'
# Display Name.
DAEMON_NAME='Zoomba Core'
# Coin Ticker.
TICKER='ZBA'
# Binary base name.
BIN_BASE='zoomba'
# Directory.
DIRECTORY='.zoomba'
# Conf File.
CONF='zoomba.conf'
# Port.
DEFAULT_PORT=5530
# Explorer URL.
EXPLORER_URL='http://45.76.76.105:8080/'
# Amount of Collateral needed.
COLLATERAL=3000
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1

# Dropbox Addnodes
DROPBOX_ADDNODES='ves43i24xyak7di'
# If set to 1 then use addnodes from dropbox.
USE_DROPBOX_ADDNODES=1
# Dropbox Bootstrap
DROPBOX_BOOTSTRAP='75l1gm49c68vhds'
# If set to 1 then use bootstrap from dropbox.
USE_DROPBOX_BOOTSTRAP=1
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='se1c5mxxlgrdrmh'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "ZOOMBA"
 _____                     _              ____
|__  /___   ___  _ __ ___ | |__   __ _   / ___|___  _ __ ___
  / // _ \ / _ \| '_ ` _ \| '_ \ / _` | | |   / _ \| '__/ _ \
 / /| (_) | (_) | | | | | | |_) | (_| | | |__| (_) | | |  __/
/____\___/ \___/|_| |_| |_|_.__/ \__,_|  \____\___/|_|  \___|

ZOOMBA
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
stty sane 2>/dev/null

