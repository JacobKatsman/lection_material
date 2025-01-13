module Bell where

-- https://ru.wikipedia.org/wiki/Число_Белла 
-- {B_{n}=\sum _{k=0}^{n - 1}{\binom {n - 1}{k}}B_{k}}

pascal :: Integral a => a -> a -> a  
pascal 0 0 = 1
pascal n 0 = 1
pascal n r | r > n  = 0
           | r < 0  = 0  
           | n == r = 1
           | otherwise  = pascal (n - 1) (r - 1) + pascal (n - 1) r

bell :: Integer -> Integer
bell n
    | n <= 1    = 1 
    | otherwise = sum [ (pascal (n-1) (k-1) * bell (k-1)) | k<-[0..n-1] ]

-- вывести все числа белла
makeBell :: Integer -> [Integer]
makeBell  n = [ (bell x) | x <- [1..n]]



