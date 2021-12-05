with import <nixpkgs> {};
pkgs.mkShell {
    name="nim";
    buildInputs = [
        stdenv.cc.cc.lib
    	pkgs.nim
    ];
    TERM="xterm-256color";
    shellHook = ''
        export LD_LIBRARY_PATH='${stdenv.cc.cc.lib}/lib/'
        echo "Ready";
    '';
}
