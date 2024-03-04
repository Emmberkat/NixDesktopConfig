{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mthwate.zsh;
in
{
  options.mthwate.zsh.enable = mkEnableOption "zsh" // {
    enable = true;
  };

  config = mkIf cfg.enable {
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
  };
}
