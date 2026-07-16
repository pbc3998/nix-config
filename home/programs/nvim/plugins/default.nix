{pkgs, ...}:
{
  programs.nixvim.plugins = {
    web-devicons.enable = true;
    extraPlugins = with pkgs.vimPlugins; [
      plenary-nvim
    ];
  };
}
