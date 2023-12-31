return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  -- opts = {
  --   debug = false,
  --   sources = {
  --     require("null-ls").builtins.formatting.prettier.with({ extra_args = {} }),
  --     require("null-ls").builtins.formatting.stylua,
  --     require("null-ls").builtins.formatting.rustfmt,
  --     require("null-ls").builtins.formatting.clang_format.with({
  --       extra_args = { "-style={IndentWidth: 4, PointerAlignment: Left}" },
  --     }),
  --     require("null-ls").builtins.code_actions.gitsigns,
  --   },
  -- },
  config = function(_, _)
    require("null-ls").setup({
      debug = true,
      sources = {
        require("null-ls").builtins.formatting.prettier.with({ extra_args = {} }),
        require("null-ls").builtins.formatting.stylua,
        -- require("null-ls").builtins.formatting.rustfmt,
        require("null-ls").builtins.formatting.clang_format.with({
          extra_args = { "-style={IndentWidth: 4, PointerAlignment: Left}" },
        }),
        require("null-ls").builtins.code_actions.gitsigns,
      },
    })
  end,
}
