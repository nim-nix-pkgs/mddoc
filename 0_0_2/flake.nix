{
  description = ''Generate Nim API docs in markdown for GitHub's README.md files.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-mddoc-0_0_2.flake = false;
  inputs.src-mddoc-0_0_2.owner = "treeform";
  inputs.src-mddoc-0_0_2.ref   = "0_0_2";
  inputs.src-mddoc-0_0_2.repo  = "mddoc";
  inputs.src-mddoc-0_0_2.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-mddoc-0_0_2"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-mddoc-0_0_2";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}