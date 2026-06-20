{ name = "problem-one"
, dependencies =
  [ "arrays"
  , "console"
  , "const"
  , "effect"
  , "exceptions"
  , "lists"
  , "maybe"
  , "partial"
  , "prelude"
  , "test-unit"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
