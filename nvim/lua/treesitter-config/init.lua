-- TODO: disable buggy Markdown parser, remove once resolved; cf.
-- -- https://github.com/nvim-treesitter/nvim-treesitter/issues/602
-- require("nvim-treesitter.parsers").get_parser_configs().markdown = nil

require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",     -- one of "all", "language", or a list of languages
  highlight = {
    enable = false,              -- false will disable the whole extension
  },
  refactor = {
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "gd",
        list_definitions = "gD",
        goto_next_usage = "<a-*>",
        goto_previous_usage = "<a-#>",
      },
    },
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["ia"] = "@parameter.inner",
      },
    },
  },
}

