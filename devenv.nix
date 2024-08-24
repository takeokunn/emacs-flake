{ pkgs, ... }: {
  cachix.enable = false;

  packages = with pkgs; [ nixfmt-classic ];

  languages.nix.enable = true;
}
