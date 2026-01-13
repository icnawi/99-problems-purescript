module Main where

import Prelude

import Effect (Effect)
import Effect.Console (log)
import Parens (isValidParens)

main :: Effect Unit
main = do
  log $ show $ isValidParens "(){}[]"
