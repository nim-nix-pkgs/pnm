{
  description = ''pnm is library for PNM (Portable AnyMap).'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs.src-pnm-v2_1_1.flake = false;
  inputs.src-pnm-v2_1_1.ref   = "refs/tags/v2.1.1";
  inputs.src-pnm-v2_1_1.owner = "jiro4989";
  inputs.src-pnm-v2_1_1.repo  = "pnm";
  inputs.src-pnm-v2_1_1.type  = "github";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@deps:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib" "src-pnm-v2_1_1"];
  in lib.mkRefOutput {
    inherit self nixpkgs ;
    src  = deps."src-pnm-v2_1_1";
    deps = builtins.removeAttrs deps args;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
  };
}