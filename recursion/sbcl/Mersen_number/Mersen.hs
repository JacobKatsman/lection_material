module Mersen where

import Math

{- calculation Mersen Number -}
{- вычисления чисел Мерсена -}
{- latex
        M_{n}=2^{n}-1
-}

mersen :: Integer -> [Integer] -> [Integer]
mersen i [] = []
mersen i (x:xs) = (2^x - 1) : (mersen x xs)

