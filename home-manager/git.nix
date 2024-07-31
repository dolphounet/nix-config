let
  username = "dolphounet";
in {
  programs.git = {
    enable = true;
    extraConfig = {
      color.ui = true;
      core.editor = "nvim";
      credential.helper = "store";
      github.user = username;
    };
    userEmail = "maxencepj.04@gmail.com";
    userName = username;
  };
}
