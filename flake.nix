{
  description = "takeokunn's emacs flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    emacs-overlay = {
      url = "github:nix-community/emacs-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, emacs-overlay }:
    let
      systems =
        [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];

      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      packages = forAllSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            overlays = [ emacs-overlay.overlays.default ];
          };
          inherit (pkgs) lib;
        in {
          default = pkgs.emacsWithPackagesFromUsePackage {
            # Your Emacs config file. Org mode babel files are also
            # supported.
            # NB: Config files cannot contain unicode characters, since
            #     they're being parsed in nix, which lacks unicode
            #     support.
            config = ./index.org;

            # Whether to include your config as a default init file.
            # If being bool, the value of config is used.
            # Its value can also be a derivation like this if you want to do some
            # substitution:
            #   defaultInitFile = pkgs.substituteAll {
            #     name = "default.el";
            #     src = ./emacs.el;
            #     inherit (config.xdg) configHome dataHome;
            #   };
            defaultInitFile = true;

            # Package is optional, defaults to pkgs.emacs
            package = pkgs.emacs;

            # For Org mode babel files, by default only code blocks with
            # `:tangle yes` are considered. Setting `alwaysTangle` to `true`
            # will include all code blocks missing the `:tangle` argument,
            # defaulting it to `yes`.
            # Note that this is NOT recommended unless you have something like
            # `#+PROPERTY: header-args:emacs-lisp :tangle yes` in your config,
            # which defaults `:tangle` to `yes`.
            alwaysTangle = true;

            # Optionally provide extra packages not in the configuration file.
            extraEmacsPackages = epkgs: with epkgs; [
              apache-mode
              bazel
              bison-mode
              cask-mode
              cfn-mode
              clojure-mode
              cmake-mode
              coffee-mode
              cmake-mode
              crontab-mode
              csharp-mode
              csv-mode
              cuda-mode
              php-mode
            ];
          };
        });
    };
}
