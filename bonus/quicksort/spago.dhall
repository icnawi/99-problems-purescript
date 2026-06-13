{ name = "quicksort-integers"
, dependencies =
  [ "arrays", "console", "effect", "lists", "prelude", "test-unit" ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
