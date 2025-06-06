{...}: {
  programs.zsh = {
    enable = true;
    initContent = ''eval "$(starship init zsh)"'';
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "thefuck"];
      theme = "dracula";
    };
  };
}
