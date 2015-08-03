if [[ -z "$SSH_TTY" ]]; then
  /usr/bin/emulationstation
else
  uname -s -r -m
fi
