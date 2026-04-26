{ dotDir, homeDir, ... }:
{
  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    "Pictures/Wallpapers".source = ./${homeDir}/Wallpapers;

    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  xdg.configFile = {
    # nvim
    "nvim/lua".source = ./${dotDir}/nvim/lua;
    "nvim/init.lua".source = ./${dotDir}/nvim/init.lua;
    # niri：拆开手工链接，不管 noctalia.kdl
    "niri/config.kdl".source = ./${dotDir}/niri/config.kdl;
    "niri/environment.kdl".source = ./${dotDir}/niri/environment.kdl;
    "niri/keybind.kdl".source = ./${dotDir}/niri/keybind.kdl;
    "niri/input.kdl".source = ./${dotDir}/niri/input.kdl;
    "niri/layerRule.kdl".source = ./${dotDir}/niri/layerRule.kdl;
    "niri/windowRule.kdl".source = ./${dotDir}/niri/windowRule.kdl;
    "niri/startup.kdl".source = ./${dotDir}/niri/startup.kdl;
  };
}
