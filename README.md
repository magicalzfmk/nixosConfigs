# DotFiles / Config for NixOs

The No Nonsense dotFiles for NixOs
    
---  

<img src="https://img.shields.io/github/stars/magicalzfmk/nixosConfigs?style=for-the-badge&logo=powerpages&color=cba6f7&logoColor=D9E0EE&labelColor=302D41"/>  
<img src="https://img.shields.io/github/last-commit/magicalzfmk/nixosConfigs?style=for-the-badge&logo=github&color=a6da95&logoColor=D9E0EE&labelColor=302D41"/>  
<img src="https://img.shields.io/github/repo-size/magicalzfmk/nixosConfigs?style=for-the-badge&logo=dropbox&color=7dc4e4&logoColor=D9E0EE&labelColor=302D41"/>  

## Features
- Home-Manager as a module
- Stylix Theming
- Waybar
- Hyprland

## Screenshots
![Wallpaper](https://github.com/magicalzfmk/nixosConfigs/blob/main/images/main.png?raw=true)

- **Note**:- Designs may be old as Design is not fixed
  (Changes made to Design may take a while to be updated here)

## Getting Started

To get started with my dotFiles, simply download the source code and run as a flake.

### Prerequisites

- Nixos
- Flakes

### Installing

1. Clone the repository  
   ``` git clone https://github.com/magicalzfmk/nixosConfigs.git ```
2. Open the project in terminal
   ```cd nixosConfigs/```
3. P.S. Change the imported hardware config with your personal one
   ```cd /hosts/default```
   ```sudo cp /etc/nixos/hardware-configuration.nix ./hardware-configuration.nix```
4. run as a flake
   ```sudo nixos-rebuild switch --flake ./#laptop```

## Contributing

I welcome contributions from anyone interested in helping to improve my dotfiles! Feel free to open an issue if you notice any bugs/problems or have suggestions for any changes/improvements.


## License

This project is licensed under the Apache-2.0 License - see the [LICENSE](LICENSE) file for details.
