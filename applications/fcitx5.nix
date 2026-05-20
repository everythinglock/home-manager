{ pkgs, ... }:
{
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.waylandFrontend = true;
    fcitx5.addons = with pkgs; [
      fcitx5-gtk
      libsForQt5.fcitx5-qt
      kdePackages.fcitx5-configtool
      qt6Packages.fcitx5-chinese-addons
      fcitx5-rime
    ];
  };
}
