module Recaman where

--https://en.wikipedia.org/wiki/Recam%C3%A1n%27s_sequence
-- a_{n}={\begin{cases}0&amp;&amp;{\text{if }}n=0\\a_{n-1}-n&amp;&amp;{\text{if }}a_{n-1}-n>0{\text{ and is not already in the sequence}}\\a_{n-1}+n&amp;&amp;{\text{otherwise}}\end{cases}}

--0, 1, 3, 6, 2, 7, 13, 20, 12, 21, 11, 22, 10, 23, 9, 24, 8, 25, 43, 62, 42, 63, 41, 18, 42, 17, 43, 16, 44, 15, 45, 14, 46, 79, 113, 78, 114, 77, 39, 78, 38, 79, 37, 80, 36, 81, 35, 82, 34, 83, 33, 84, 32, 85, 31, 86, 30, 87, 29, 88, 28, 89, 27, 90, 26, 91, 157, 224, 156, 225, 155, ... 


recaman :: Integer -> [Integer]
recaman n = reverse (go 0 0 [])
            where
                go i a_n xs | i > n    = xs
                            | (am > 0) && (not (any (am ==) xs)) = go (i + 1) am (am : xs)
                            | otherwise = go (i + 1) ap (ap : xs)
                            where  am =  a_n - (i + 1)
                                   ap =  a_n + (i + 1)






