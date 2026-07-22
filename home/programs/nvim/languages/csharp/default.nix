{ pkgs, ... }:
{
  programs.nixvim.plugins.lsp.servers.roslyn_ls = {
    enable = true;
  };

  programs.nixvim.plugins.conform-nvim.settings.formatters_by_ft = { cs = "csharpier"; };

  programs.nixvim.plugins.treesitter.grammarPackages = [ pkgs.vimPlugins.nvim-treesitter.builtGrammars.c-sharp ];
}
