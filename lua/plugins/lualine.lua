return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  opts = {
    options = {
      -- section_separators = { left = "", right = "" },
      -- component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      component_separators = { left = "|", right = "|" },
      globalstatus = true,
      theme = "auto",
      disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
    },
    -- winbar = {
    -- 	lualine_a = {},
    -- 	lualine_b = {},
    -- 	lualine_c = { "filename" },
    -- 	lualine_x = {},
    -- 	lualine_y = {},
    -- 	lualine_z = {},
    -- },
    -- inactive_winbar = {
    -- 	lualine_a = {},
    -- 	lualine_b = {},
    -- 	lualine_c = { "filename" },
    -- 	lualine_x = {},
    -- 	lualine_y = {},
    -- 	lualine_z = {},
    -- },
  },
}
