{
  description = "Une configuration qui configure";

  inputs = {
    # Nixpkgs
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    # Home manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.91.1-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags.url = "github:Aylur/ags/v1";

    catppuccin.url = "github:catppuccin/nix";

    nix-nvim.url = "github:dolphounet/nix-nvim";

    flake-programs-sqlite.url = "github:wamserma/flake-programs-sqlite";
    flake-programs-sqlite.inputs.nixpkgs.follows = "nixpkgs";

    ghostty.url = "github:ghostty-org/ghostty";
    zen-browser.url = "github:0xc000022070/zen-browser-flake";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    lix-module,
    catppuccin,
    flake-programs-sqlite,
    ghostty,
    zen-browser,
    ...
  } @ inputs: let
    inherit (self) outputs;
  in {
    packages."x86_64-linux" = let
      pkgs = nixpkgs.legacyPackages."x86_64-linux";
    in {
      banana-cursor-dreams = pkgs.callPackage ./pkgs/banana-cursor-dreams.nix {};
    };

    # NixOS configuration entrypoint
    # Available through 'nixos-rebuild --flake .#your-hostname'
    nixosConfigurations = {
      "nixos" = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit inputs outputs;};
        system = "x86_64-linux";
        # > Our main nixos configuration file <
        modules = [
          ./nixos
          lix-module.nixosModules.lixFromNixpkgs
          catppuccin.nixosModules.catppuccin
          flake-programs-sqlite.nixosModules.programs-sqlite
        ];
      };
    };

    # Standalone home-manager configuration entrypoint
    # Available through 'home-manager --flake .#your-username@your-hostname'
  };
}
