{
  plugins.render-markdown = {
    enable = true;
    lazyLoad.settings.ft = [ "markdown" ];
    settings = {
      max_file_size = 0.5; # MB
    };
  };
}
