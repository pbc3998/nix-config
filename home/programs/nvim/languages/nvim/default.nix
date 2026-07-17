{
  programs.nixvim.plugins.cmp.cmdline = {
    "/" = {
      mapping = {
        __raw = "cmp.mapping.preset.cmdline()";
      };
      sources = [
        { name = "buffer"; }
      ];
    };

    ":" = {
      mapping = {
        __raw = "cmp.mapping.preset.cmdline()";
      };
      sources = [
        { name = "path"; }
        { name = "cmdline"; }
      ];
      matching = {
        disallow_symbol_nonprefix_matching = false;
      };
    };
  };
}
