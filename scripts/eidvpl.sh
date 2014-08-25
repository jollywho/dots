sudo mount /dev/sr0 /media/1
a=$(find /media/1 -type f -printf x | wc -c)
b=$(find /media/1 -type d -printf x | wc -c)
if [[ $a -gt 0 || $b -gt 1 ]]; then
  printf "starting..."
  temp=$(mktemp -d /mnt/casper/chishiki/dvds/XXXX)
  cp -rf /media/1/* $temp
  chmod 777 $temp
  tput setaf 2
  banner -C --font=2 '##DONE##'
  tput setaf 5
  printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -
  sudo umount /media/1
  eject
else
  printf "not run"
fi
