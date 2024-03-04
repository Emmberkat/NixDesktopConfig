{ config, lib, pkgs, utils, ... }:
{
  imports = [
    ./neovim.nix
    ./zsh.nix
  ];
}
