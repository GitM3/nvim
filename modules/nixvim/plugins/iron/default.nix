{ config, lib, ... }:
{
  # iron.nvim base configuration
  plugins.iron = {
    enable = true;

    # Keep consistent with repo's lazy-load convention
    lazyLoad.settings = {
      event = [ "DeferredUIEnter" ];
    };

    # Options passed to require('iron.core').setup
    settings = {
      highlight = {
        italic = true;
      };

      keymaps = {
        send_line = "<space>il";
        send_motion = "<space>ic";
        visual_send = "<space>ic";
        send_file = "<space>if";
        send_mark = "<space>im";
        send_paragraph = "<space>ip";
        send_until_cursor = "<space>iu";

        mark_motion = "<space>mc";
        mark_visual = "<space>mc";
        remove_mark = "<space>md";
        cr = "<space>i<cr>";
        interrupt = "<space>i<space>";
        exit = "<space>iq";
        clear = "<space>il";
        restart_repl = "<space>ir";
        toggle_repl = "<space>ii";

      };

      repl_definition = {
        python = {
          command = [ "python3" ];
          format.__raw = "require('iron.fts.common').bracketed_paste_python";
          env = {
            PYTHON_BASIC_REPL = "1";
          };
          block_dividers = [
            "# %%"
            "#%%"
          ];
        };
        sh = {
          command = [ "zsh" ];
        };
        env = {
          PYTHON_BASIC_REPL = "1";
        };

      };

      config = {
        repl_open_cmd = {
          __raw = ''require("iron.view").split.vertical.botright("40%")'';
        };
      };

      scratch_repl = true;

      ignore_blank_lines = true;
    };
  };
  # which-key group for Obsidian
  plugins.which-key.settings.spec = lib.optionals config.plugins.obsidian.enable [
    {
      __unkeyed-1 = "<leader>i";
      group = "Iron REPL";
      icon = "󱃖";
    }
  ];
}
