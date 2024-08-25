{ pkgs }:
epkgs:
let
  language = import ./packages/language.nix { inherit epkgs pkgs; };
  awesome = import ./packages/awesome.nix { inherit epkgs; };
  language_specific =
    import ./packages/language_specific.nix { inherit epkgs; };
  elfeed = import ./packages/elfeed.nix { inherit epkgs; };
  eshell = import ./packages/eshell.nix { inherit epkgs; };
  org_mode = import ./packages/org_mode.nix { inherit epkgs; };
  exwm = import ./packages/exwm.nix { inherit epkgs; };
  ai = import ./packages/ai.nix { inherit epkgs; };
in language ++ awesome ++ language_specific ++ elfeed ++ eshell ++ org_mode
++ exwm ++ ai
