{ config, lib, ... }:
{
  # Obsidian.nvim base configuration
  plugins.obsidian = {
    enable = true;
    lazyLoad.settings = {
      cmd = [
        "Obsidian"
      ];
      ft = [ "markdown" ];
      event = [
        "BufReadPre"
        "BufNewFile"
      ];
    };
    # Expose the command(s) so the plugin lazy-loads when used
    # This makes :Obsidian available even before a markdown file is opened
    # legacy_commands = false;
    # Options for require('obsidian').setup
    settings = {
      legacy_commands = false;
      workspaces = [
        {
          name = "notes";
          path = "~/Documents/Obsidian/K4IZ3N/";
        }
      ];

      templates = {
        subdir = "templates";
        date_format = "%Y-%m-%d";
        time_format = "%H:%M";
      };

      completion = {
        # Set to true if using nvim-cmp; this repo uses blink-cmp
        nvim_cmp = false;
        min_chars = 2;
      };

      # Use Neovim statusline instead of Obsidian UI
      ui.enable = false;
    };
  };

  # Helpful command keymaps
  keymaps = lib.optionals config.plugins.obsidian.enable [
    {
      mode = "n";
      key = "<leader>oo";
      action = "<cmd>Obsidian open<CR>";
      options.desc = "Open note in Obsidian app";
    }
    {
      mode = "n";
      key = "<leader>on";
      action = "<cmd>Obsidian new<CR>";
      options.desc = "New note";
    }
    {
      mode = "n";
      key = "<leader>oq";
      action = "<cmd>Obsidian quick_switch<CR>";
      options.desc = "Quick switch note";
    }
    {
      mode = "n";
      key = "<leader>os";
      action = "<cmd>Obsidian search<CR>";
      options.desc = "Search notes";
    }
    {
      mode = "n";
      key = "<leader>ob";
      action = "<cmd>Obsidian backlinks<CR>";
      options.desc = "Show backlinks";
    }
    {
      mode = "n";
      key = "<leader>of";
      action = "<cmd>Obsidian follow_link<CR>";
      options.desc = "Follow link under cursor";
    }
    {
      mode = "n";
      key = "<leader>ot";
      action = "<cmd>Obsidian toc<CR>";
      options.desc = "Table of contents";
    }
    {
      mode = "n";
      key = "<leader>oT";
      action = "<cmd>Obsidian template<CR>";
      options.desc = "Insert template";
    }
    {
      mode = "n";
      key = "<leader>ol";
      action = "<cmd>Obsidian links<CR>";
      options.desc = "List links in note";
    }
    {
      mode = "n";
      key = "<leader>op";
      action = "<cmd>Obsidian paste_img<CR>";
      options.desc = "Paste image from clipboard";
    }
    {
      mode = "n";
      key = "<leader>or";
      action = "<cmd>Obsidian rename<CR>";
      options.desc = "Rename note";
    }
    {
      mode = "n";
      key = "<leader>ox";
      action = "<cmd>Obsidian toggle_checkbox<CR>";
      options.desc = "Toggle checkbox";
    }
  ];

  # which-key group for Obsidian
  plugins.which-key.settings.spec = lib.optionals config.plugins.obsidian.enable [
    {
      __unkeyed-1 = "<leader>o";
      group = "Obsidian";
      icon = "";
    }
  ];
}
