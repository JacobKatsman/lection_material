module Math where

factorial :: Integer -> Integer  
factorial n = product [1..n]  

factorial_fast :: Int -> [Integer]  
factorial_fast n = take n factorials
    where factorials = 1 : zipWith (*) factorials [2..]
