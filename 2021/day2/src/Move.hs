module Move where

data Position = Position
  { horizontal :: Integer,
    depth :: Integer,
    aim :: Integer
  }
  deriving (Show)

data Move = Forward Integer | Up Integer | Down Integer deriving (Show)

move :: Position -> Move -> Position
move pos (Forward x) = pos {horizontal = horizontal pos + x, depth = depth pos + aim pos * x}
move pos (Up x) = pos {aim = aim pos - x}
move pos (Down x) = pos {aim = aim pos + x}

goTo :: [Move] -> Position
goTo = foldl move initialPosition
  where
    initialPosition = Position 0 0 0
