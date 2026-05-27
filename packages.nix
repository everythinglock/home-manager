{
  pkgs,
  upkgs,
  lib,
  ...
}:
let
  packages = {
    ai = {
      chatbox = upkgs.chatbox;
    };

    # 编辑器与开发
    editor = {
      vscode = pkgs.vscode-fhs;
    };

    language = {
      nodejs = pkgs.nodejs;
      python = {
        lib = pkgs.python312.withPackages (ps: [
          ps.rich
          ps.requests
        ]);
        uv = pkgs.uv;
      };
      c = {
        gcc = pkgs.gcc;
      };
      go = {
        golang = pkgs.go;
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
  home.activation.createNpmGlobarDir = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    mkdir -p $HOME/.npm-global
    ${pkgs.nodejs}/bin/npm config set prefix '~/.npm-global'
  '';
}
