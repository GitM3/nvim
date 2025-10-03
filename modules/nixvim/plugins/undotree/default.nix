{ config, lib, ... }:
{
  # Template for nixvim upstream plugin
  # Replace undotree with actual plugin name
  plugins.undotree = {
    enable = true;

    settings = {
      # Add plugin-specific configuration here
      SetFocusWhenToggle = true;
      # Persistent undo: save undofiles under ~/.local/share/nvim/undodir
      __raw = ''
        if vim.fn.has("persistent_undo") == 1 then
          local undodir = vim.fn.expand("~/.local/share/nvim/undodir")
          if vim.fn.isdirectory(undodir) == 0 then
            vim.fn.mkdir(undodir, "p", 0700)
          end
          vim.o.undodir = undodir
          vim.o.undofile = true
        end
      '';
    };
  };

  keymaps = lib.optionals config.plugins.undotree.enable [
    {
      mode = "n";
      key = "<leader>uu";
      action = "<cmd>UndotreeToggle<CR>";
      options.desc = "Toggle UndoTree";
    }
    {
      mode = "n";
      key = "<leader>uf";
      action = "<cmd>UndotreeFocus<CR>";
      options.desc = "Focus UndoTree window";
    }
  ];
}
