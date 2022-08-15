{
  description = "Tango rollback netplay for Mega Man Battle Network";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs";
  };

  outputs = { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      tango = import ./tango.nix { 
        appImageRun = pkgs.appimage-run;
        tangoApp = pkgs.fetchurl {
          url = "https://github.com/tangobattle/tango/releases/download/v3.2.68/Tango-3.2.68-linux-x86_64.AppImage";
          sha256 = "1r8p1sndb1w7ixqq17cmc3rcabh68kgv4ppi1bvp13fhq0x3h4zf";
        };
        stdenv = pkgs.stdenv; 
      };
    in {
      packages.x86_64-linux.tango = tango;

      defaultPackage.x86_64-linux = self.packages.x86_64-linux.tango;

      devShell.x86_64-linux = pkgs.mkShell { buildInputs = [ self.packages.x86_64-linux.tango ]; };
    };
}

