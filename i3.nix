{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mthwate.i3;
in
{
  options.mthwate.i3.enable = mkEnableOption "i3";

  config = mkIf cfg.enable {
    xsession.windowManager.i3 = {
      enable = true;
      config = {
        bars = [
          {
            position = "bottom";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ${config.home.homeDirectory}/.config/i3status-rust/config-bottom.toml";
            fonts = {
              style = "Bold";
              size = 10.0;
            };
          }
        ];
      };
    };
    programs = {
      i3status-rust = {
        enable = true;
        bars = {
          bottom = {
            blocks = [
              {
                block = "cpu";
                interval = 1;
              }
              {
                block = "memory";
                format = " $icon $mem_used_percents ";
              }
              {
                block = "sound";
              }
              {
                block = "time";
                format = " $timestamp.datetime(f:'%a %d/%m %R') ";
                interval = 1;
              }
            ];
          };
        };
      };
    };
    services.picom = {
      enable = true;
      vSync = true;
      backend = "glx";
    };
  };
}

