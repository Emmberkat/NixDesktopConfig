{ config, lib, pkgs, utils, ... }:
{
  imports = [
    ./i3.nix
    ./neovim.nix
    ./zsh.nix
  ];
}
