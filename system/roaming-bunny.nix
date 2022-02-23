{ config, pkgs, ... }:

{ imports = [ ./common.nix ./roaming-bunny.hardware-configuration.nix ]
; networking =
    { hostName = "roaming-bunny"
    ; interfaces.enp38s0f1.useDHCP = true
    ; interfaces.wlp0s20f3.useDHCP = true
    ; }
; services.xserver.xkbOptions = "ctrl:swapcaps"
; }
