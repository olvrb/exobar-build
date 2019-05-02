# Exobar Build

###### The best development environment for [Exobar](https://repo.nepeta.me/depiction/me.nepeta.exobar).

## Getting started
- Be in a bash-like environment, such as macOS terminal, WSL or any Linux terminal.
- Clone this repo
    - `git clone git@github.com:olvrb/exobar-build.git`
- Change information in [control](./control) and [src/info.plist](./src/info.plist)
- Make [build.sh](./build.sh) executable
    - `chmod +x build.sh`
- ???
- Done!

Keep in mind the Exobar build uses environment variables for installing the package onto your device. See [env.md](./env.md).

## Documentation
### Files
- [README.md](./README.md)
- **[build](./build/)**
    - Generated builds
- [build.sh](./build.sh)    
    - Build script
- [control](./control)
    - Control file used by dpkg and Sileo to get information about package
- **[src](./src/)**
    - Your source files
    - [info.plist](./src/info.plist)
        - Information file used by Exobar to display your widget
    - [theme.html](./src/theme.html)
        - Template html file

# LICENSE
Exobar Build is licensed under the GNU GPL 3.0 license, see [LICENSE](./LICENSE).