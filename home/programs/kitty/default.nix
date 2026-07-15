{ settings, ... }:
{
  programs.kitty = {
    enable = true;
    font = {
      name = settings.font;
      size = 9;
    };

    settings = {
      scrollback_lines = 10000;
      enable_audio_bell = false;
      update_check_interval = 0;

      tab_bar_edge = "bottom";
      tab_bar_style = "powerline";
      tab_powerline_style = "slanted";
      tab_title_template = "{title}{' :{}:'.format(num_windows) if num_windows > 1 else ''}";

      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      window_padding_width = 25;
      cursor_trail = 1;

      background_opacity = "0.85";

      background = "#070f1c";
      foreground = "#e0d9c7";

      cursor = "#e0d9c7";

      selection_foreground = "#050539";
      selection_background = "#f2e5c8";

      # Black / Grey
      color0 = "#0e0807";
      color8 = "#2f516c";

      # Red
      color1 = "#ea6847";
      color9 = "#d943a8";

      # Green
      color2 = "#ea6847";
      color10 = "#616d33";

      # Yellow
      color3 = "#5db2f8";
      color11 = "#86dbf5";

      # Blue
      color4 = "#2f516c";
      color12 = "#5db2f8";

      # Magenta
      color5 = "#d943a8";
      color13 = "#d943a8";

      # Cyan
      color6 = "#86dbf5";
      color14 = "#ea6847";

      # White
      color7 = "#e0d9c7";
      color15 = "#e0d9c7";
    };
  };
}
