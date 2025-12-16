return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "c_sharp", "fsharp" },
    },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        "github:mason-org/mason-registry",
        -- NOTE: official mason registry doesn't have `roslyn` so we have to
        -- add the following registry:
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "roslyn",

        -- NOTE: we could install `netcoredbg` here as well, but they don't
        -- ship with native arm64 binaries (which i need since i run on mac),
        -- so I have to get them from `M4urici0GM/dap-cs`
      },
    },
  },

  {
    "seblyng/roslyn.nvim",
    ---@module 'roslyn.config'
    ---@type RoslynNvimConfig
    ft = { "cs" },
    opts = {
      silent = true,
    },
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        roslyn = {
          dotnet_organize_imports_on_format = true,
          dotnet_show_completion_items_from_unimported_namespaces = true,
        },
      },
      setup = {
        roslyn = function()
          vim.lsp.config("roslyn", {})
        end,
      },
    },
  },

  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "Nsidorenco/neotest-vstest",
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {
          dap_settings = {
            type = "coreclr",
          },
        },
      },
    },
  },
}
