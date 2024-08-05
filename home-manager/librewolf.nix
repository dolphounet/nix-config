{
  inputs,
  pkgs,
  ...
}: {
  programs.firefox.enable = false;
  programs.librewolf = {
    enable = false;
    settings = {
      "identity.fxaccounts.enabled" = true;
      "privacy.resistFingerprinting" = false;
    };
  };
}
