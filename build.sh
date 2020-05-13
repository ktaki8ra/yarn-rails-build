#!/bin/sh

# yarn install
# rails s [-p xxxx]

function yarn_command() {
  echo "yarn installing..."
  yarn install;
  return 1
}


if [ $# == 0 ]; then
  yarn_command
  if [ $? -gt 0 ]; then
    echo "Starting Rails Server..."
    rails s
  else
    echo "[Error] Failed yarn install."
  fi
  exit 1
elif [ $# == 2 ]; then
  yarn_command
  if [ $? -gt 0 ]; then
    echo "yarn installed."
    case $1 in
      "-p")
        echo "Starting Rails Server..."
        rails s -p $2
        ;;
      *)
        echo "[Error] Can't build Rails Server"
        echo "+-------------------------------------------------------------------------+"
        echo "| Please run [ ./build.sh -p (port number) ] or [ ./build.sh ](port:3000) |"
        echo "+-------------------------------------------------------------------------+"
        ;;
    esac
  else
    echo "[Error] Failed yarn install."
  fi
  exit 1
else
  echo "[Error] invalid number of args"
fi
