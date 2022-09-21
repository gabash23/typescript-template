let 
  pkgs = import <nixpkgs> {};
in pkgs.mkShell {
  name = "bucephalus-backend";

  buildInputs = with pkgs; [
    nodejs-16_x
    yarn
    redis
    postgresql
    pgcli
  ];
}

