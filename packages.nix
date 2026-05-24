{
  pkgs,
  upkgs,
  lib,
  ...
}:
let
  packages = {
    ai = {
      aider = upkgs.aider-chat;
      claude = upkgs.claude-code;
      chatbox = upkgs.chatbox;
      cherry-studio = upkgs.cherry-studio;
      pi = upkgs.pi-coding-agent;
    };

    # 编辑器与开发
    editor = {
      vscode = pkgs.vscode-fhs;
    };

    language = {
      nodejs = pkgs.nodejs;
      python = pkgs.python313.withPackages (ps: [
        ps.rich
        ps.requests
      ]);
      c = {
        gcc = pkgs.gcc;
      };
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
      notes = upkgs.obsidian;
    };

    social = {
      qq = pkgs.qq;
    };

    project = {
      codeToMarkdown = pkgs.repomix;
    };
  };
in
{
  home.packages = lib.collect lib.isDerivation packages;
}
