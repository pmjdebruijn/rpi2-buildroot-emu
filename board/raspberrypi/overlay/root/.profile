if [[ -z "$SSH_TTY" ]]; then
  echo -en '\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n'
  /usr/bin/emulationstation
  echo 'Please do NOT disconnect your Raspberry Pi from power'
  echo ''
  echo 'Connect a USB keyboard and ...'
  echo '... type "exit" to return to the game menu'
  echo '... type "halt" to cleanly shut down the system before disconnecting from power'
else
  uname -s -r -m
fi
