{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mthwate.git;
in
{
  options.mthwate.git.enable = mkEnableOption "shell" // {
    default = true;
  };

  config = mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        userName = "Matthew Benkart";
        userEmail = "matthewbenkart@gmail.com";
        lfs.enable = true;
        extraConfig = {
          init.defaultBranch = "main";
        };
      };
    };
  };
}
