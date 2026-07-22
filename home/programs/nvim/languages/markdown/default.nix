{pkgs, ...}:
{
  programs.nixvim.plugins.lsp.servers.marksman = {
    enable = true;
  };

  programs.nixvim.plugins.treesitter.grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
    markdown
    markdown_inline
  ];
}
