{ name = "my-project"
, dependencies =
  [
  , "console"
  , "effect"
  , "lists"
  , "prelude"
  , "test-unit"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
}
