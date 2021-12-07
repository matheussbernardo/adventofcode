module Lib (run) where

import Move (goTo)
import qualified Parser

run = do
  movesStr <- lines <$> readFile "day2_input.txt"
  let result = map Parser.parse movesStr
  let position = goTo result
  print position
  pure ()