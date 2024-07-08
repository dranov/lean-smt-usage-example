import Lake
open Lake DSL

require smt from git "https://github.com/ufmg-smite/lean-smt.git"@"main"

def libcpp : String :=
  if System.Platform.isWindows then "libstdc++-6.dll"
  else if System.Platform.isOSX then "libc++.dylib"
  else "libstdc++.so.6"

package «smter» where
  precompileModules := true
  moreLeanArgs := #[s!"--load-dynlib={libcpp}"]
  moreGlobalServerArgs := #[s!"--load-dynlib={libcpp}"]
  -- TODO: make this cross-platform
  moreLinkArgs := #["-L/usr/lib/x86_64-linux-gnu", "/usr/lib/x86_64-linux-gnu/libstdc++.so.6"]

lean_lib «Smter» where

@[default_target]
lean_exe «smter» where
  root := `Main
