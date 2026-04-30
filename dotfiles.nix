{ dotDir, homeDir, ... }:
{
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "Pictures/Wallpapers".source = ./${homeDir}/Wallpapers;
    "Applications/scripts".source = ./${homeDir}/scripts;

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  xdg.configFile = {
    # nvim
    "nvim/lua".source = ./${dotDir}/nvim/lua;
    "nvim/init.lua".source = ./${dotDir}/nvim/init.lua;
    # niri
    "niri/modules".source = ./${dotDir}/niri/modules;
    "niri/config.kdl".source = ./${dotDir}/niri/config.kdl;
  };
}
