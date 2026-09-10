data Symbol = X | O
  deriving (Eq)

data Game = Game
  { board :: [Maybe Symbol]
  , currentPlayer :: Symbol
  , winner :: Maybe Symbol
  , isGameOver :: Bool
  }

mark :: Game -> Int -> Game
mark game index =
  let newBoard = replace index (Just (currentPlayer game)) (board game)
      newWinner = getWinner newBoard
  in Game
      newBoard
      (nextPlayer (currentPlayer game))
      newWinner
      (newWinner /= Nothing || all (/= Nothing) newBoard)

nextPlayer :: Symbol -> Symbol
nextPlayer X = O
nextPlayer O = X

getWinner :: [Maybe Symbol] -> Maybe Symbol
getWinner board =
  findWinner
    [ [0,1,2], [3,4,5], [6,7,8]
    , [0,3,6], [1,4,7], [2,5,8]
    , [0,4,8], [2,4,6]
    ]
  where
    findWinner [] = Nothing
    findWinner ([a,b,c] : rest) =
      case (get a board, get b board, get c board) of
        (Just x, Just y, Just z)
          | x == y && y == z -> Just x
        _ -> findWinner rest

get :: Int -> [a] -> Maybe a
get 0 (x:_) = Just x
get _ (_:xs) = get 0 xs
get _ [] = Nothing

replace :: Int -> a -> [a] -> [a]
replace 0 value (_:xs) = value : xs
replace index value (x:xs) = x : replace (index - 1) value xs
replace _ _ [] = []
