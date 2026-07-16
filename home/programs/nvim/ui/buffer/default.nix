{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings.options = {
      mode = "buffer";
      always_show_bufferline = false;
      separator_style = "slant";

      show_buffer_icons = true;
      show_buffer_close_icons = false;
      show_close_icon = false;

      numbers = "ordinal";

      offsets = [
        {
          filetype = "neo-tree";
          text = "File Explorer";
          text_align = "center";
          separator = true;
        }
      ];

      diagnostics = "nvim_lsp";
    };
  };
}
