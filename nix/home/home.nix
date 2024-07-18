{ inputs, config, pkgs, ... }:

{
  imports = [];

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

  home.username = "joel";
  home.homeDirectory = "/home/joel";

  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "23.11"; # Please read the comment before changing.

  programs = {
    alacritty = (import ./alacritty.nix { inherit config pkgs; });
  };
}
