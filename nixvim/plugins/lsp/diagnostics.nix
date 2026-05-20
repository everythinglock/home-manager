{
  diagnostic.settings = {
    update_in_insert = false;
    severity_sort = true;

    virtual_text = {
      severity.min = "warn";
      source = "if_many";
    };
    virtual_lines = {
      current_line = true;
    };

    float = {
      border = "rounded";
    };

    jump = {
      severity.__raw = "{ min = vim.diagnostic.severity.WARN }";
    };

    signs = {
      text = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "";
        "__rawKey__vim.diagnostic.severity.WARN" = "";
        "__rawKey__vim.diagnostic.severity.HINT" = "󰌵";
        "__rawKey__vim.diagnostic.severity.INFO" = "";
      };
      texthl = {
        "__rawKey__vim.diagnostic.severity.ERROR" = "DiagnosticError";
        "__rawKey__vim.diagnostic.severity.WARN" = "DiagnosticWarn";
        "__rawKey__vim.diagnostic.severity.HINT" = "DiagnosticHint";
        "__rawKey__vim.diagnostic.severity.INFO" = "DiagnosticInfo";
      };
    };
  };
  keymaps = [
    # ── 诊断跳转 ──
    {
      mode = "n";
      key = "[d";
      action.__raw = "vim.diagnostic.goto_prev";
      options.desc = "Previous diagnostic";
    }
    {
      mode = "n";
      key = "]d";
      action.__raw = "vim.diagnostic.goto_next";
      options.desc = "Next diagnostic";
    }
    {
      mode = "n";
      key = "<leader>df";
      action.__raw = "vim.diagnostic.open_float";
      options.desc = "Show diagnostic float";
    }
    {
      mode = "n";
      key = "<leader>dl";
      action.__raw = "vim.diagnostic.setloclist";
      options.desc = "Send diagnostics to location list";
    }
  ];
}
