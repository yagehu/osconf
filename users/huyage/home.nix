{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "huyage";
  home.homeDirectory = "/home/huyage";

  home.packages = with pkgs; [
    cargo
    cmake
    gcc
    gnumake
    gnupg
    libtool
    rustc
    rustfmt
    rust-analyzer
    slack
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  #home.stateVersion = "21.11";

  gtk = {
    enable = true;
    font.name = "Cantarell";
    theme.name = "Adwaita-dark";
  };

  programs.emacs = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "Yage Hu";
    userEmail = "huyage@fastmail.com";
    aliases = {
      br = "branch";
      ci = "commit";
      st = "status";
    };
    extraConfig = {
      diff.colorMoved = "zebra";
      fetch.prune = true;
      init.defaultBranch = "main";
      pull.rebase = true;
    };
  };

  programs.gnome-terminal = {
    enable = true;

    profile.main = {
      default = true;
      visibleName = "main";
      font = "JetBrains Mono";
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  programs.zsh =
    { enable = true
    ; enableAutosuggestions = true
    ; oh-my-zsh =
        { enable = true
        ; plugins = [ "git" ]
        ; theme = "agnoster"
	; }
    ; };
}
