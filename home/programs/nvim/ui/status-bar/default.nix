{
  programs.nixvim.plugins = {
    lualine = {
      enable = true;

      settings = {
        options = {
          theme = "auto";

          componentSeparators = { left = "|"; right = "|"; };
          sectionSeparators = { left = ""; right = ""; };

          globalstatus = true;
        };

        lualine_a = [ "mode" ];

        lualine_b = [ "branch" "diff" ];

        lualine_c = [
          {
            __unkeyed-1 = "filename";
            file_status = true;
            path = 1;
          }
        ];

        lualine_x = [
          {
            __unkeyed-1 = "diagnostics";
            sources = [ "nvim_diagnostic" ];
            symbols = { error = " "; warn = " "; info = "󰋼 "; hint = " "; };
          }
            "encoding"
            "fileformat"
            "filetype"
          ];

        lualine_y = [ "progress" ];
        lualine_z = [ "location" ];
      };
    };
  };
}
