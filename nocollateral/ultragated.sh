#!/bin/bash
# shellcheck disable=SC2034

# Copyright (c) 2019
# All rights reserved.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND.

: '
# Run this file

```
bash -ic "$(wget -4qO- -o- raw.githubusercontent.com/mikeytown2/masternode/master/nocollateral/ultragated.sh)" ; source ~/.bashrc
```

'

# Github user and project.
GITHUB_REPO='ultranatum/ultragate'
# Display Name.
DAEMON_NAME='Ultragate Core'
# Coin Ticker.
TICKER='ULG'
# Binary base name.
BIN_BASE='ultragate'
# Directory.
DIRECTORY='.ultragate'
# Conf File.
CONF='ultragate.conf'
# Port.
DEFAULT_PORT=32852
# Explorer URL.
EXPLORER_URL='https://explorer.ultragate.online/'
# Rate limit explorer.
EXPLORER_SLEEP=1
# Amount of Collateral needed.
COLLATERAL=4000
# Direct Daemon Download if github has no releases.
DAEMON_DOWNLOAD=''
# Blocktime in seconds.
BLOCKTIME=60
# Cycle Daemon on first start.
DAEMON_CYCLE=1
# Multiple on single IP.
MULTI_IP_MODE=1


# Tip Address.
TIPS='GX76zugEeDJAa5V9Ued6FrrEF7sGHUZ9rB'
# Dropbox Addnodes.
DROPBOX_ADDNODES='ewi8exokhknerpa'
# Dropbox Bootstrap.
DROPBOX_BOOTSTRAP='4isj4van2o7i73s'
# Dropbox blocks and chainstake folders.
DROPBOX_BLOCKS_N_CHAINS='nsi6lfvmerqye00'

ASCII_ART () {
echo -e "\e[0m"
clear 2> /dev/null
cat << "ULTRAGATE"
 _   _ _ _                         _          ____
| | | | | |_ _ __ __ _  __ _  __ _| |_ ___   / ___|___  _ __ ___
| | | | | __| '__/ _` |/ _` |/ _` | __/ _ \ | |   / _ \| '__/ _ \
| |_| | | |_| | | (_| | (_| | (_| | ||  __/ | |__| (_) | | |  __/
 \___/|_|\__|_|  \__,_|\__, |\__,_|\__\___|  \____\___/|_|  \___|
                       |___/

ULTRAGATE
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
  wget -4qo- gist.githubusercontent.com/mikeytown2/1637d98130ac7dfbfa4d24bac0598107/raw/mcarper.sh -O ~/___mn.sh
  COUNTER=1
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

