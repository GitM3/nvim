_: {
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
        send_line = "<space>sl";
        send_motion = "<space>sc";
        visual_send = "<space>sc";
        send_file = "<space>sf";
        send_mark = "<space>sm";
        mark_motion = "<space>mc";
        mark_visual = "<space>mc";
        remove_mark = "<space>md";
        cr = "<space>s<cr>";
        interrupt = "<space>s<space>";
        exit = "<space>sq";
        clear = "<space>cl";
      };

      repl_definition = {
        python = {
          command = [ "python3" ];
          format = {
            __raw = "require('iron.fts.common').bracketed_paste_python";
          };
        };
        sh = {
          command = [ "zsh" ];
        };
      };

      repl_open_cmd = {
        __raw = "require(\"iron.view\").bottom(40)";
      };

      scratch_repl = true;

      ignore_blank_lines = true;
    };
  };
}
