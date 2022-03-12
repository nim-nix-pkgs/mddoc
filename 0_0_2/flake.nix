{
  description = ''Generated Nim's API docs in markdown for github's README.md files. Great for small libraries with simple APIs.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-mddoc-0_0_2.flake = false;
  inputs.src-mddoc-0_0_2.owner = "treeform";
  inputs.src-mddoc-0_0_2.ref   = "refs/tags/0.0.2";
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