return {
  {
    "xeluxee/competitest.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = "cpp",
    opts = {
      testcases_use_single_file = true,
    },
    config = function(_, opts)
      require("competitest").setup(opts)
      vim.keymap.set("n", "<leader>ta", "<cmd>CompetiTest add_testcase<CR>")
      vim.keymap.set("n", "<leader>te", "<cmd>CompetiTest edit_testcase<CR>")
      vim.keymap.set("n", "<leader>tr", "<cmd>CompetiTest run<CR>")
      vim.keymap.set("n", "<leader>ts", "<cmd>CompetiTest show_ui<CR>")
      vim.keymap.set("n", "<leader>tt", "<cmd>CompetiTest receive testcases<CR>")
    end,
  },
}
