
{ config, pkgs, inputs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.loader.systemd-boot.configurationLimit = 10;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 1w";
  };

  networking.hostName = "kyoto"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  virtualisation.virtualbox.guest.enable = true;

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Africa/Accra";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ak_GH";
    LC_IDENTIFICATION = "ak_GH";
    LC_MEASUREMENT = "ak_GH";
    LC_MONETARY = "ak_GH";
    LC_NAME = "ak_GH";
    LC_NUMERIC = "ak_GH";
    LC_PAPER = "ak_GH";
    LC_TELEPHONE = "ak_GH";
    LC_TIME = "ak_GH";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    displayManager.defaultSession = "none+i3";
    desktopManager.xterm.enable = false;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
        dmenu i3lock i3status i3blocks
      ];
    };
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = ["nix-command" "flakes"];

  programs.zsh.enable = true;
  users.users.g = {
    isNormalUser = true;
    description = "gandalf";
    extraGroups = ["networkmanager" "wheel"];
    shell = pkgs.zsh;
  };
  environment.pathsToLink = [ "/share/zsh" ];

  environment.systemPackages = with pkgs; [
    git
    vim 
    gnumake
    wget
    rio
    unzip
    xclip
    clipmenu
  ];
  environment.variables.EDITOR = "vim";

  fonts.packages = with pkgs; [
    hermit
    source-code-pro
    terminus_font
  ];

  system.stateVersion = "23.11"; # Did you read the comment?
}
