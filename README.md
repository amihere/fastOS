## Fast OS

- Nix flakes - Manage Packages & Version Lock.  
- Nix Home Manager - Configure packages for user.  
- Neovim (mainly setup & options, with Mason & Packer stripped out and placed in Nix HM)
- Tmux (coming soon)
- Z SHell (git and z plugins setup with Nix + oh-my-zsh)
- i3 (minimal config with keybindings made vim-like)
- Java, Go Lang focused

### Steps

Run with: 
```
nix-shell -p wget
wget https://github.com/amihere/fastOS/archive/refs/heads/main.zip && unzip main.zip && rm main.zip
sudo nixos-rebuild switch --flake .#kyoto
```

OR:  

`nix --extra-experimental-features "nix-command flakes" build 'github:amihere/fastOS#nixosConfigurations.kyoto.config.system.build.toplevel'`

Revised:
`nixos-rebuild switch --flake 'github:amihere/fastOS#kyoto'`

### include steps to setup from minimal os
