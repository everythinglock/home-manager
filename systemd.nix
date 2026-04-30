{ pkgs, ... }:
{
  systemd.user.services.xwayland-satellite = {
    Unit = {
      Description = "Xwayland satellite on :12";
      BindsTo = [ "niri.service" ];
      After = [
        "niri.service"
        "fcitx5-daemon.service"
      ];
    };
    Service = {
      # 使用 ${pkgs.xxx} 自动获取 store 中的路径
      ExecStart = "${pkgs.xwayland-satellite}/bin/xwayland-satellite :12";
      Restart = "on-failure";
    };
    Install = {
      WantedBy = [ "niri.service" ];
    };
  };
}
