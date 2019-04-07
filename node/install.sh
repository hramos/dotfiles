if test ! $(which react-native)
then
  if test $(which npm)
  then
    sudo npm install react-native-cli -g
  fi
fi
