import Lake
open Lake DSL

require smt from git "https://github.com/ufmg-smite/lean-smt.git"@"main"

package «smter» where

lean_lib «Smter» where
  -- add library configuration options here

@[default_target]
lean_exe «smter» where
  root := `Main
