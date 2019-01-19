while true; do
    read -p "Do you wish to reboot this system? [Y/N]:" yn
    case $yn in
        [Yy]* ) make install; break;;
        [Nn]* ) exit;;
        * ) echo "Please answer yes or no.";;
    esac
done
