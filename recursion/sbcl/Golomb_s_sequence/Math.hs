module Golombs where

-- https://en.wikipedia.org/wiki/Golomb_sequence
-- a(1)=1;a(n+1)=1+a(n+1-a(a(n)))

-- n       1   2   3   4   5   6   7   8   9   10  11  12  
-- G(n)    1   2   2   3   3   4   4   4   5   5   5   6   

-- оно мягко сказать не очень эффективно, но здесь простота над оптимальностью
golombs :: Integral a => a -> a  
golombs n  |  n == 1  = 1
           | otherwise  = 1 + (golombs (n - golombs (golombs(n - 1))))

-- вывести все числа Golomb's
makeGolombs :: Integer -> [Integer]
makeGolombs  n = [ (golombs x) | x <- [1..n]]



