module Math where

{- Pell  numbers  -}
{- latex
 P_{n}={\begin{cases}0,n=0;\\1,n=1\\2P_{n-1}+P_{n-2},n>1\end{cases}}
-}

pell :: Integral a => a -> a
pell n  | n < 0  = 0
        | n == 0 = 0
        | n == 1 = 1
        | otherwise  =  (2 * pell(n - 1)) + pell(n - 2)

makePell :: Integer -> [Integer]
makePell  n = [ (pell x) | x <- [1..n]]
