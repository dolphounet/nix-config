{
  inputs,
  pkgs,
  ...
}: {
  programs.fish = {
    enable = true;
    interactiveShellInit = ''
      set fish_greeting # Disable greeting
      cowsay "NixOS btw"
    '';
    shellAliases = {
      cat = "bat";
      ls = "eza";
    };

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
