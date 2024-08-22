{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mthwate.shell;
in
{
  options.mthwate.shell.enable = mkEnableOption "shell" // {
    default = true;
  };

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      fzf
      powerline-fonts
    ];

    fonts.fontconfig.enable = true;

    programs = {
      zoxide.enable = true;
      starship = {
        enable = true;
        settings = {
          add_newline = false;
          line_break.disabled = true;
        };
      };
      bash.enable = true;
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
