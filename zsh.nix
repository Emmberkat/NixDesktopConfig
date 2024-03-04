{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mthwate.zsh;
in
{
  options.mthwate.zsh.enable = mkEnableOption "zsh" // {
    default = true;
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fzf
      powerline-fonts
    ];

    fonts.fontconfig.enable = true;

    programs = {
      starship = {
        enable = true;
        settings = {
          add_newline = false;
          line_break.disabled = true;
        };
      };
      zsh = {
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
  };
}
