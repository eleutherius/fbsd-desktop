[ en | [ru](doc/README-ru.md) ]


[![BSD license](https://img.shields.io/pypi/l/flask.svg)](
https://github.com/eleutherius/fbsd-desktop/blob/master/LICENSE)

# FBSD-Desktop

###  About FBSD-Desktop

FBSD-Desktop - it is bash script for install X-server for you!

### Roadmap

- [x]  Firewall setup
- [x]  Make stable installation
- [ ]  Fix GitHub script
- [ ]  Add auto mounting
- [x]  Add support Intel graphic card
- [ ]  Add auto generate /etc/X11/xorg.conf


### Gnome-Shell

[![Gnome-Shell](https://github.com/eleutherius/fbsd-desktop/blob/master/doc/gnome.png)](
https://github.com/eleutherius/fbsd-desktop/blob/master/doc/gnome.png)

### Installation

```
% sudo pkg install -y bash git
```
add   ```Username_of_your_user   ALL=(ALL) ALL``` to the ```/usr/local/etc/sudoers```

```
% git clone https://github.com/eleutherius/fbsd-desktop
% cd fbsd-desktop
% sudo bash fbsd_desktop.sh
```

[![Screen](https://github.com/eleutherius/fbsd-desktop/blob/master/doc/screen.png)](
https://github.com/eleutherius/fbsd-desktop/blob/master/doc/screen.png)

### Contributing

1. You can fork this repository and add your changes