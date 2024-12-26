{ config, lib, pkgs, ... }:
with lib;
let
  cfg = config.mthwate.term;
in
{
  options.mthwate.term.enable = mkEnableOption "term";

  config = mkIf cfg.enable {
    home.packages = with pkgs; [
      wezterm
    ];

    xdg.configFile."wezterm/wezterm.lua".text = ''
      local wezterm = require 'wezterm'
      local config = wezterm.config_builder()
      config.hide_tab_bar_if_only_one_tab = true
      config.front_end = "WebGpu"
      return config
    '';
  };
}

