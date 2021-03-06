# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{ imports = [ ]
; boot =
  { devShmSize = "120g"
    # Use the systemd-boot EFI boot loader.
  ; loader.systemd-boot.enable = true
  ; loader.efi.canTouchEfiVariables = true
    # https://github.com/NixOS/nixpkgs/issues/103161#issuecomment-737189895
  ; kernelModules = [ "uhid" ]
  ; kernelPackages = pkgs.linuxPackages_latest
  ; }

  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Set your time zone.
  # time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to false here.
  # Per-interface useDHCP will be mandatory in the future, so this generated config
  # replicates the default behaviour.
; networking.useDHCP = false

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  # i18n.defaultLocale = "en_US.UTF-8";
  # console = {
  #   font = "Lat2-Terminus16";
  #   keyMap = "us";
  # };

  # Enable the X11 windowing system.
  ; services.xserver =
    { enable = true
    ; displayManager.gdm.enable = true
    ; desktopManager.gnome.enable = true
    ; }

  # Configure keymap in X11
  # services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  # Enable sound.
  # sound.enable = true;
  # hardware.pulseaudio.enable = true;

  # Enable touchpad support (enabled default in most desktopManager).
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  ; users.users.huyage = {
    isNormalUser = true;
    home = "/home/huyage";
    extraGroups =
      [ "libvirtd"
        "wheel"
        "networkmanager"
      ]; # Enable ‘sudo’ for the user.
    shell = pkgs.zsh;
  }

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  ; environment.systemPackages = with pkgs;
    [ _1password-gui
      bind
      emacs
      firefox
      git
      gnome.gnome-tweaks
      jq
      neovim
      openssl
      ripgrep
      virt-manager
      wget
    ]

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

; programs.dconf.enable = true
; programs.zsh.enable = true;

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "21.11" # Did you read the comment?
; security.pam.loginLimits =
  [
    { domain = "*"
    ; type = "-"
    ; item = "nofile"
    ; value = "9192"
    ; }
  ]
; nix = {
    package = pkgs.nixFlakes;
    extraOptions = ''
      experimental-features = nix-command flakes
    '';
  };

  nixpkgs.config.allowUnfree = true;

  fonts.fonts = with pkgs; [
    noto-fonts-cjk
    jetbrains-mono
  ]

; virtualisation =
    { libvirtd =
      { enable = true
      ; }
    ; podman =
        { enable = true
        ; dockerCompat = true
        ; }
    ; }
; }

