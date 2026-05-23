{ pkgs, upkgs, lib, ... }:
let
  packages = {
    ai = {
      terminal = pkgs.claude-code;
      chatbox = upkgs.chatbox;
    };

    # 编辑器与开发
    editor = {
      vscode = pkgs.vscode;
    };

    language = {
      nodejs = pkgs.nodejs;
      python = pkgs.python313;
    };

    desktop = {
      theme = pkgs.nwg-look;
      launcher = pkgs.vicinae;
      fileManager = pkgs.pcmanfm;
    };

    screenshot = {
      grabber = pkgs.grim;
      selector = pkgs.slurp;
      annotator = pkgs.satty;
    };

    clipboard = {
      history = pkgs.cliphist;
      backend = pkgs.wl-clipboard;
    };

    office = {
      writer = pkgs.libreoffice;
      notes = pkgs.obsidian;
    };

    social = {
      qq = pkgs.qq;
    };
  };
in
{
  home.packages = lib.collect lib.isDerivation packages;
}
