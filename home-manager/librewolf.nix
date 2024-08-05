{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox.enable = true;
  programs.librewolf = {
    enable = false;
    settings = {
      "identity.fxaccounts.enabled" = true;
      "privacy.resistFingerprinting" = false;
    };
  };
}
