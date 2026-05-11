# xdg.nix
{ config, pkgs, ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      # --- 文件夹 ---
      "inode/directory" = [ "thunar.desktop" ];

      # --- 网页和链接 ---
      "text/html" = [ "firefox.desktop" ];
      "application/xhtml+xml" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/ftp" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];

      # --- 纯文本与代码 ---
      "text/plain" = [ "code.desktop" ];
      "text/csv" = [ "code.desktop" ];
      "text/xml" = [ "code.desktop" ];
      "application/xml" = [ "code.desktop" ];
      "application/json" = [ "code.desktop" ];
      "application/x-shellscript" = [ "code.desktop" ];
      # 可以通过通配符把大部分已知文本文件丢给 VSCode
      "text/*" = [ "code.desktop" ];

      # --- 图片关联到 Loupe ---
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/svg+xml" = [ "org.gnome.Loupe.desktop" ];

      # --- 视频关联到 Showtime ---
      "video/mp4" = [ "org.gnome.Showtime.desktop" ];
      "video/webm" = [ "org.gnome.Showtime.desktop" ];
      "video/x-matroska" = [ "org.gnome.Showtime.desktop" ];
      "application/msword" = [ "libreoffice-writer.desktop" ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [
        "libreoffice-writer.desktop"
      ];
      "application/vnd.oasis.opendocument.text" = [ "libreoffice-writer.desktop" ];
      "application/rtf" = [ "libreoffice-writer.desktop" ];

      # Excel 类型
      "application/vnd.ms-excel" = [ "libreoffice-calc.desktop" ];
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [
        "libreoffice-calc.desktop"
      ];
      "application/vnd.oasis.opendocument.spreadsheet" = [ "libreoffice-calc.desktop" ];

      # PowerPoint 类型
      "application/vnd.ms-powerpoint" = [ "libreoffice-impress.desktop" ];
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
        "libreoffice-impress.desktop"
      ];
      "application/vnd.oasis.opendocument.presentation" = [ "libreoffice-impress.desktop" ];

      # 可选：Draw 类型（ODG 绘图）
      "application/vnd.oasis.opendocument.graphics" = [ "libreoffice-draw.desktop" ];
    };
  };
}
