{
  inputs,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  
  home.packages = with pkgs; [
    zoxide
    
  ]
}
