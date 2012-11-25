module TTT.Board
  ( emptyBoard
  , isWinner
  , fromString
  , Board
  , markers
  , size
  ) where

data Board = Board
  { markers :: [String]
  , size    :: Int
  } deriving (Show)

isWinner :: Board -> Char -> Bool
isWinner board marker = False

emptyBoard = fromString "         "

fromString str = Board {markers=markers, size=size}
  where
    size    = squareRoot $ length str
    markers = split str size

squareRoot :: Int -> Int
squareRoot = floor . sqrt . (fromIntegral :: Int -> Double)

split [] size = []
split str size = take size str : split (drop size str) size
