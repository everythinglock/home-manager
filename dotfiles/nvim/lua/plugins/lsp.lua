return {
  -- 禁用 Mason 自动安装工具
  {
    "mason-org/mason-lspconfig.nvim",
    enabled = false,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        lua_ls = {},
        pyright = {},
        gopls = {},
        nil_ls = {},
      },
    },
  },
}
