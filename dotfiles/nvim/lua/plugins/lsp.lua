return {
	-- 禁用 Mason 自动安装工具
	{ "mason-org/mason.nvim", enabled = false },
	{ "mason-org/mason-lspconfig.nvim", enabled = false },
	-- -- 设置相关工具
	-- {
	-- 	"neovim/nvim-lspconfig",
	-- 	opts = {
	-- 		servers = {
	-- 			lua_ls = {}, -- Lua
	-- 			pyright = {}, -- Python
	-- 			nil_ls = {}, -- Nix 语言
	-- 			bashls = {}, -- Bash
	-- 		},
	-- 	},
	-- },
	-- {
	-- 	"stevearc/conform.nvim",
	-- 	opts = {
	-- 		-- 同样地，在这里配置保存时格式化工具
	-- 		formatters_by_ft = {
	-- 			lua = { "stylua" },
	-- 			python = { "isort", "black" },
	-- 			nix = { "nixfmt" },
	-- 			bash = { "shmft" },
	-- 		},
	-- 	},
	-- },
}
