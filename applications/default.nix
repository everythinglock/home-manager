{ pkgs, ... }:
{
  imports = [
    ./niri
    ./fcitx5.nix
  ];
  home.packages = with pkgs; [
    xwayland-satellite # xwayland
  ];
}
