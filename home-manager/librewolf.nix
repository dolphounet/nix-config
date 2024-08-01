{
  inputs,
  pkgs,
  ...
}: {
  programs.librewolf = {
    enable = true;
    settings = {
      "identity.fxaccounts.enabled" = true;
      "privace.resistFingerprinting" = false;
    };
  };
}
