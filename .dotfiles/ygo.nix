# flake.nix
{
  description = "YGO Omega simulator";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      packages.${system}.ygo-omega = pkgs.appimageTools.wrapType2 rec {
        name = "ygo-omega";
        # Path to your downloaded AppImage
        src = ./ygo-omega.AppImage;

        extraInstallCommands = ''
          mkdir -p $out/share/applications
          cp ${pkgs.fetchurl {
            url = "https://duelistsunite.org";
            sha256 = "0000000000000000000000000000000000000000000000000000"; # Add actual hash here
          }} $out/share/icons/ygo-omega.png
          
          echo "[Desktop Entry]
          Name=YGO Omega
          Exec=ygo-omega
          Icon=ygo-omega
          Type=Application
          Categories=Game;" > $out/share/applications/ygo-omega.desktop
        '';
      };

      defaultPackage.${system} = self.packages.${system}.ygo-omega;
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = [ self.packages.${system}.ygo-omega ];
      };
    };
}
