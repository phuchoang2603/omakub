# Detect the operating system
if [ -f "/etc/os-release" ]; then
  . /etc/os-release
  if [ "$ID" == "cachyos" ]; then
    OMAKUB_OS_ID="arch"
  else
    OMAKUB_OS_ID=$ID
  fi
else
  OMAKUB_OS_ID="unknown"
fi
export OMAKUB_OS_ID
