{ pkgs, ... }:
let
#  nigpkgsRev = "nixpkgs-21.11-darwin";
#  pkgs = import (fetchTarball "https://github.com/nixos/nixpkgs/archive/${nigpkgsRev}.tar.gz") {};

  imports = [
    ./programs/fish.nix
#    ./programs/kitty.nix
  ];
in
{
  inherit imports;

  nixpkgs.config = {
    allowUnfree = true;
    allowUnsupportedSystem = true;
    allowBroken = true;
  };

  # Let Home Manager install and manage itself.
  # programs.home-manager.enable = true;

  # Home Manager needs a bit of information about you and the
  # paths it should manage.
#  home.username = "robert";
#  home.homeDirectory = "/Users/robert";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.05";

  home.packages = with pkgs; [
    bat
    bottom
    btop
    cht-sh
    curl
    diskonaut
    du-dust
    duf
    entr
    exa
    fd # finder
    fzf # fuzzy finder
    helix # helix text editor
    jq
    lazydocker
    neovim
    pandoc
    peep # pager
    pgformatter
    procs # ps replacement
    ranger # file manager
    ripgrep
    thefuck
    (texlive.combine { inherit (texlive) scheme-full; })
    texlab # lsp for tex
    tig # ui for git
    tmux
    w3m
    weechat
    zoxide # cd replacement
  ];

 home.sessionVariables = {
    EDITOR = "nvim";
    SHELL = "fish";
  };

  programs.direnv.enable = true;
  programs.direnv.nix-direnv.enable = true;
}
