# Detect the operating system
if [ -f "/etc/os-release" ]; then
  . /etc/os-release
  OMAKUB_OS_ID=$ID
else
  OMAKUB_OS_ID="unknown"
fi
export OMAKUB_OS_ID
