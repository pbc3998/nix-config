rec {
  shell = "zsh";
  editor = "code";
  browser = "firefox";
  pager = "bat --plain --pager='less -FR'";

  alias = {
    cd = "z";
    cat = "bat";
    less = pager;
    nano = editor;
  };
}
