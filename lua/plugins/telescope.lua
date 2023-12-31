return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>sf",
        function()
          require("telescope.builtin").find_files()
        end,
        desc = "Search Files",
      },
      {
        "<leader>sg",
        function()
          require("telescope.builtin").live_grep()
        end,
        desc = "Search Live Grep",
      },
      {
        "<leader>sw",
        function()
          require("telescope.builtin").grep_string()
        end,
        desc = "Search current word",
      },
      {
        "<leader>sh",
        function()
          require("telescope.builtin").help_tags()
        end,
        desc = "Search Help Tags",
      },
      {
        "<leader>sc",
        function()
          require("telescope.builtin").colorscheme()
        end,
        desc = "Search colorscheme",
      },
      {
        "<leader>/",
        function()
          require("telescope.builtin").buffers()
        end,
        desc = "Search buffers",
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").current_buffer_fuzzy_find()
        end,
        desc = "Seach String in Current buffer",
      },
    },
    opts = {
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
      },
    },
  },
}
