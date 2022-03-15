{ description = "My NixOS configuration."
; inputs =
  { nixpkgs.url = "nixpkgs/nixos-21.11"
  ; home-manager.url = "github:nix-community/home-manager/release-21.11"
  ; home-manager.inputs.nixpkgs.follows = "nixpkgs"
  ; }
; outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs
      { inherit system
      ; config = { allowUnfree = true; }
      ; };
    lib = nixpkgs.lib;
  in
    { nixosConfigurations =
      { bun = lib.nixosSystem
        { inherit system
        ; modules = [ system/bun.nix ]
        ; }
      ; roaming-bunny = lib.nixosSystem
        { inherit system
        ; modules = [ system/roaming-bunny.nix ]
        ; }
      ; }
    ; homeConfigurations.huyage = home-manager.lib.homeManagerConfiguration
      { inherit system pkgs
      ; username = "huyage"
      ; homeDirectory = "/home/huyage"
      ; stateVersion = "21.11"
      ; configuration = import users/huyage/home.nix
    ; }
  ; }
; }
