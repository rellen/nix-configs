{config, pkgs, ... }:

{

  programs.fish = {
    enable = true;
    shellAliases = {
      ll = "ls -la";
      lash = "ls -lash";

      cat = "bat";

      vim = "nvim";

      # python
      python = "python3";

      # git
      gs = "git status";
      ga = "git add";
      gc = "git commit";
      gp = "git push";
      gpl = "git pull";
      gco = "git checkout";
      giff = "git diff";
      grest = "git restore";
      gr = "cd (git rev-parse --show-toplevel)";

      # elixir
      mt = "mix test";
      ips = "iex -S mix phx.server";

      ## gigalixir
      gx = "gigalixir";
      gxl = "gigalixir logs";
    };
    plugins = [
     {
          name = "theme-bobthefish";
          src = pkgs.fetchFromGitHub {
            owner = "oh-my-fish";
            repo = "theme-bobthefish";
            rev = "626bd39b002535d69e56adba5b58a1060cfb6d7b";
            sha256 = "06whihwk7cpyi3bxvvh3qqbd5560rknm88psrajvj7308slf0jfd";
          };
     }
    ];
    interactiveShellInit = ''
      thefuck --alias | source
      set -g theme_color_scheme dracula
      set -Ux EDITOR nvim
      zoxide init fish | source
    '';
    loginShellInit = ''
    '';
  };
}
