{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.emmberkat.git;
in
{
  options.emmberkat.git.enable = mkEnableOption "shell" // {
    default = true;
  };

  config = mkIf cfg.enable {
    programs = {
      git = {
        enable = true;
        lfs.enable = true;
      };
    };
  };
}
