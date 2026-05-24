let
  cpp = "clangd";
in
{
  plugins.lsp = {
    servers = {
      ${cpp} = {
        enable = true;
        cmd = [
          "clangd"
          "--background-index" # 后台建立索引，提速跳转
          "--clang-tidy" # 开启clang-tidy 诊断
          "--header-insertion=never" # 禁用自动引入头文件
          "--completion-style=detailed"
        ];
      };
    };
  };
}
