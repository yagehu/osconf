{ config, pkgs, ... }:

{ imports = [ ./common.nix ./bun.hardware-configuration.nix ]
; networking =
    { hostName = "bun"
    ; interfaces.enp3s0.useDHCP = true
    ; }
; services.xserver.videoDrivers = [ "nvidia" ]
; }
