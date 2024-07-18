{ config, pkgs, ... }:
{
  enable = true;

  history = {
    size = 10000;
    path = "$HOME/.zsh_history";
    ignoreAllDups = true;
  };

  initExtra = "source $HOME/.aliases";

  oh-my-zsh = {
    enable = true;
    plugins = [
      "git" "sudo" "thefuck"
    ];
  };
}
