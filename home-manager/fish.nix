{
  inputs,
  pkgs,
  ...
}: {
  programs.fish.enable = true;
  
 # Zoxide
 programs.zoxide = {
   enable = true;
   enableFishIntegration = true;
   options = {
    "--cmd cd"
   };
 };
}
