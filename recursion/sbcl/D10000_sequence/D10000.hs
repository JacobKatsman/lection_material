module D10000 where


-- https://ru.wikipedia.org/wiki/Последовательность_Хофштадтера
-- {\begin{aligned}a(1)&amp;=a(2)=1,\\a(n)&amp;=a(a(n-1))+a(n-a(n-1)),\quad n>2.\end{aligned}}

--- Hofstadter Q-sequence: a(1) = a(2) = 1; a(n) = a(n-a(n-1)) + a(n-a(n-2)) for n > 2.
--  (Formerly M0438)

-- https://en.wikipedia.org/wiki/Hofstadter_sequence
-- https://oeis.org/A005185
-- {\begin{aligned}a(1)&amp;=a(2)=1,\\a(n)&amp;=a(a(n-1))+a(n-a(n-1)),\quad n>2.\end{aligned}}
-- https://rosettacode.org/wiki/Hofstadter_Q_sequence

--  НЕэффективная реализация (!)
dSeq :: Integer -> Integer                                   
dSeq    n           |    n == 1  =  1 
                    |    n == 2  =  1  
                    |    otherwise =  (dSeq (dSeq (n - 1) ) + dSeq (n - (dSeq (n - 1)))) 

-- эффективная реализация (!) 
dSeqEffect1 :: [Int] ->Int -> [Int]
dSeqEffect1 xs n  | n > 100 = xs
                    | otherwise = dSeqEffect1 (((xs !! (xs !! (n - 1))) + (xs !! (n - (xs !! (n - 1)))) ) : xs) (n + 1)


-- окончательная реализация
douglasHofstadter :: Int -> [Int]
douglasHofstadter m = reverse (dSeqEffect [1,1] 2 m)
                      where
                           dSeqEffect xs n m | n > m = xs
                                             | otherwise = dSeqEffect (((xs !! (xs !! (n - 1))) + (xs !! (n - (xs !! (n - 1)))) ) : xs) (n + 1) m                 
              






 
