{
  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<A-d>";
      action = "<CMD>BufferLineCycleNext<CR>";
      options = {
        silent = true;
        desc = "Cycle to next buffer (Ctrl+Tab behavior)";
      };
    }

    {
      mode = "n";
      key = "<A-f>";
      action = "<CMD>BufferLineCyclePrev<CR>";
      options = {
        silent = true;
        desc = "Cycle to previous buffer (Ctrl+Shift+Tab behavior)";
      };
    }

    {
      mode = "n";
      key = "<A-s>";
      action = "<CMD>bd<CR>";
      options = {
        silent = true;
        desc = "Close current buffer/tab";
      };
    }
  ];
}
