{
  lib,
  config,
  username,
  ...
}:
{
  xdg.configFile = {
    "niri/config.kdl".text = ''
      include "modules/keybind.kdl"
      include "modules/input.kdl"
      include "modules/windowRule.kdl"
      include "modules/layerRule.kdl"
      include "modules/startup.kdl"

      include "noctalia.kdl"
    '';
    "niri/modules".source = ./modules;
  };
  home.activation.createNoctalia = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    target="/home/${username}/.config/niri/noctalia.kdl"
    if [ ! -e "$target" ]; then
      mkdir -p "$(dirname "$target")"
      touch "$target"
      chmod u+w "$target"
    fi
  '';
}
