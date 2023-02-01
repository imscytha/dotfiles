local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "typescript",
    "c",
    "kotlin",
    "java",
    "python",
    "kotlin",
    "bash",
    "markdown",
    "json", "jsonc", "json5",
    "dockerfile", "go",
    "sql",
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp", "html-lsp", "typescript-language-server", "deno",

    --shell
    "bash-language-server", "bash-debug-adapter",

    -- "pyright", "",

    -- JVM
    "jdtls", "java-debug-adapter", "kotlin-language-server", "ktlint",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

return M
