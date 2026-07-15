rec {
  shell = "zsh";
  editor = "code";
  browser = "vivaldi";
  pager = "bat --plain --pager='less -FR'";

  alias = {
    cd = "z";
    cat = "bat";
    less = pager;
    nano = editor;
    grep = "rg";
    find = "fd";
  };
}
