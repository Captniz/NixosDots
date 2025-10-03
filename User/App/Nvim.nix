{
  config,
  lib,
  pkgs,
  userSettings,
  ...
}:
{
  programs.neovim = {
    plugins = [ pkgs.vimPlugins.lazy-nvim ];
    extraLuaConfig =
      with pkgs.vimPlugins;
      # lua
      ''
        require("lazy").setup({
          rocks = { enabled = false },
        pkg = { enabled = false },
        install = { missing = false },
        change_detection = { enabled = false },
          spec = {
            {
              -- since we used `with pkgs.vimPlugins` this will expand to the correct path
              dir = "${nvim-cmp}",
              name = "nvim-cmp",
              event = { "InsertEnter", "CmdlineEnter" },
              dependencies = {
                -- we can also load dependencies from a local folder
                { dir = "${cmp-nvim-lsp}", name = "cmp-nvim-lsp" },
                { dir = "${cmp-path}", name = "cmp-path" },
                { dir = "${cmp-buffer}", name = "cmp-buffer" },
                { dir = "${cmp-cmdline}", name = "cmp-cmdline" },
              },
              config = function ()
                local cmp = require('cmp')

                cmp.setup({
                  sources = cmp.config.sources({
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                  }),
                  snippet = {
                    expand = function(args)
                      vim.snippet.expand(args.body)
                    end,
                  },
                  mapping = cmp.mapping.preset.insert({}),
                })

                -- Use buffer source for `/` and `?`
                cmp.setup.cmdline({ '/', '?' }, {
                  mapping = cmp.mapping.preset.cmdline(),
                  sources = {
                    { name = 'buffer' },
                  },
                })

                -- Use cmdline & path source for ':'
                cmp.setup.cmdline(':', {
                  mapping = cmp.mapping.preset.cmdline(),
                  sources = cmp.config.sources({
                    { name = 'path' },
                  }, {
                    { name = 'cmdline' },
                  }),
                  matching = { disallow_symbol_nonprefix_matching = false },
                })
              end,
            },
          },
        })
      '';
  };
}
