{
  inputs,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    catppuccin.enable = false;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      cowsay "NixOS btw"
    '';
    shellAliases = {
      cat = "bat";
      ls = "eza";
      sudo = "sudo ";
      echo = "echo ";
      gitflake = "git add flake.lock && git commit -m 'nix flake update'";
    };
  };

  # direnv
  programs.direnv = {
    enable = true;
    #enableFishIntegration = true;
    nix-direnv.enable = true;
  };

  # Zoxide
  programs.zoxide = {
    enable = true;
    enableFishIntegration = true;
    options = [
      "--cmd cd"
    ];
  };

  home.packages = with pkgs; [
    cowsay
    eza
  ];
}
