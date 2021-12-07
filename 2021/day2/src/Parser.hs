module Parser (Parser.parse) where

import Move (Move (..))
import Text.Parsec (digit, many, parse, space, string, (<|>))
import Text.Parsec.String (Parser)

parse :: String -> Move
parse str = case Text.Parsec.parse parseMove "" str of
  Left err -> error "deu ruim"
  Right m -> m

parseMove :: Parser Move
parseMove = parseForward <|> parseUp <|> parseDown

parseForward :: Parser Move
parseForward = do
  _ <- string "forward"
  space
  digits <- many digit
  pure (Forward (read digits))

parseUp :: Parser Move
parseUp = do
  _ <- string "up"
  space
  digits <- many digit
  pure (Up (read digits))

parseDown :: Parser Move
parseDown = do
  _ <- string "down"
  space
  digits <- many digit
  pure (Down (read digits))