{ name = "problem-3"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "lists"
  , "maybe"
  , "partial"
  , "prelude"
  , "strings"
  , "test-unit"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
