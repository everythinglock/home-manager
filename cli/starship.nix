{
  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      git_branch = {
        style = "bold purple";
      };
      directory = {
        truncation_length = 3;
      };
    };
  };
}
