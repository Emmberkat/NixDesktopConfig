{ config, pkgs, ... }:
{
  home.packages = with pkgs; [
    fzf
  ];
  programs.zsh = {
    enable = true;
    oh-my-zsh = {
      enable = true;
      theme = "gianu";
      plugins = [
        "git"
        "sudo"
        "ssh-agent"
        "fzf"
      ];
    };
  };
}
