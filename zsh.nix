{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
  ];
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      plugins = [
        "git"
        "sudo"
        "ssh-agent"
        "fzf"
      ];
    };
  };
}
