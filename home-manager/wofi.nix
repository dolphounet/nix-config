{
  inputs,
  pkgs,
  ...
}: {
  programs.wofi = {
    enable = true;
    settings = {
      term="foot";
      location="top";
      yoffset=280;
      width="25%";
      lines=11;

      prompt="Search...";
      show="drun";
      insensitive=true;
      allow_images=true;
      hide_scroll=true;

      aways_parse_args=true;
      show_all=true;
    };
    style = 
      "
      * {
        font-family: 'JetBrainsMono NF';
        font-size: 15px;
        font-weight: 600;
      }


      #window {
        margin: 0px;
        border: 0.0px solid;
        /*border-color: rgb(235, 77, 129);*/
        border-radius: 10px;
        background-color: rgba(30, 30, 46, 0.7);
        color:  /*rgb(235, 77, 129)*/ #b4befe;
      }

      #input {
        margin: 15px;
        background-color: #6c7086;
        color: #11111b;
        border-radius: 25px;
        border: 2px solid #b4befe;
      }

      #scroll {
        margin-bottom: 15px;
      }

      #entry {
        margin: 0px 15px;
      }

      #entry:selected {
        /*background-color: /*rgb(245, 98, 36);*/
        background-color: #b4befe;
        color: #1e1e2e;
        border-radius: 10px;
        border: none;
        outline: none;
      }

      #entry > box {
        margin-left: 16px;
      }

      #entry image {
        padding-right: 10px;
      }
      ";
  };
}
