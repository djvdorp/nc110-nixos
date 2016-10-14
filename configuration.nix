# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader = {
    grub.enable = true;
    grub.version = 2;
    grub.device = "nodev";
  };

  boot.initrd.luks.devices = [ { name = "cryptroot"; device = "/dev/sda2"; preLVM = true; } ];

  networking = {
    hostName = "nc110"; # Define your hostname.
    networkmanager.enable = true; # Enables networking support via NetworkManager.
  };

  # Select internationalisation properties.
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

  # Set your time zone.
  time.timeZone = "Europe/Amsterdam";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    python
    python27Packages.virtualenv
    python27Packages.virtualenvwrapper
    python3
    curl
    wget
    axel
    screen
    tmux
    htop
    fail2ban
    ack
    sakura
    sudo
    i3status
    dmenu
    xautolock
    gnome3.dconf
    networkmanagerapplet
    alsaUtils
    pulseaudioLight
    firefox
    chromium
    midori
    vlc
    feh
    gpicview
    epdfview
    scrot
    imagemagick_light
    pcmanfm
    mc
    ranger
    xarchiver
    nano
    vim
    geany
    zip
    unzip
    unrar
    gzip
    p7zip
    mailnag
    thunderbird
    git
    subversion
    tig
    dunst
    unclutter
    parcellite
  ];

  environment.variables = {
    NO_AT_BRIDGE = "1";
  };

  # List services that you want to enable:
  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    layout = "us";
    xkbOptions = "eurosign:e";
    synaptics.enable = true;
    windowManager.i3.enable = true;
    displayManager.sessionCommands = "${pkgs.networkmanagerapplet}/bin/nm-applet &";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.daniel = {
    createHome = true;
    extraGroups = [ "wheel" "networkmanager" ];
    isNormalUser = true;
    uid = 1000;
  };

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "16.09";

  nixpkgs.system = "x86_64-linux";
  boot.kernelPackages = pkgs.linuxPackages_4_8;

  nixpkgs.config.allowUnfree = true;

  programs.zsh.enable = true;
  users.defaultUserShell = "/run/current-system/sw/bin/zsh";

  programs.ssh.startAgent = true;
}
