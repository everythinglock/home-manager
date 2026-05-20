{ username, ... }:
let
  noctaliaInclude =
    if builtins.pathExists "/home/${username}/.config/niri/noctalia.kdl" then
      ''include "noctalia.kdl"''
    else
      "";
in
{
  xdg.configFile = {
    "niri/config.kdl".text = ''
      include "modules/keybind.kdl"
      include "modules/input.kdl"
      include "modules/windowRule.kdl"
      include "modules/layerRule.kdl"
      include "modules/startup.kdl"
      ${noctaliaInclude}
    '';
    "niri/modules".source = ./modules;
  };

}
