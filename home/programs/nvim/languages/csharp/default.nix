{
  programs.nixvim.plugins.lsp.servers.roslyn_ls = {
    enable = true;
  };

  programs.nixvim.plugins.conform-nvim.settings.formatters_by_ft = { cs = "csharpier"; };

  programs.nixvim.plugins.treesitter.settings.ensure_installed = [ "c_sharp" ];
}
