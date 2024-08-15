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
    };
    shellInitLast = ''
      set -g direnv_fish_mode disable_arrow
      direnv hook fish | source
    '';

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
