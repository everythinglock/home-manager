{
  programs.fzf = {
    enable = true;
    defaultCommand = "fd --type f --hidden --exclude .git";
    changeDirWidgetCommand = "fd --type d --hidden";
    fileWidgetCommand = "fd --type f --hidden";
  };

}
