{ config, lib, pkgs, utils, ... }:
{
  imports = [
    ./git.nix
    ./i3.nix
    ./neovim.nix
    ./term.nix
    ./zsh.nix
  ];
}
