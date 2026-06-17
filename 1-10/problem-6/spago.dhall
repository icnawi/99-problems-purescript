{ name = "my-project"
, dependencies =
  [ "arrays"
  , "console"
  , "effect"
  , "lists"
  , "maybe"
  , "prelude"
  , "profunctor"
  , "strings"
  , "test-unit"
  , "tuples"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
