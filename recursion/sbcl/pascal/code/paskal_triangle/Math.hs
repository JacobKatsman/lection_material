module Math where

{- Binomial cooeficient Newtone / pascal  triangle -}
{- http://mech.math.msu.su/~shvetz/54/inf/perl-examples/PerlExamples_PascalTriangle.xhtml -}
{- https://stackoverflow.com/questions/42798257/add-a-element-at-the-end-of-list-in-haskell -}
{- https://rosettacode.org/wiki/List_comprehensions -}

pascal :: Integral a => a -> a -> a  
pascal 0 0 = 1
pascal n 0 = 1
pascal n r | n == r = 1
           | otherwise  = pascal (n - 1) (r - 1) + pascal (n - 1) r

binom :: Integral a => a -> [a]
binom n = map (pascal n) [0..n]

makeTriangle :: Integer -> [[Integer]]
makeTriangle  n = [ (binom x) | x <- [1..n]]



