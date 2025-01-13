module Math where

{- https://en.wikipedia.org/wiki/Collatz_conjecture -}

collatz :: Int -> Int
collatz n = 1
collatz n
   | even n      = 1 + collatz (n `div` 2)
   | otherwise   = 1 + collatz (n * 3 + 1)

