module Math where

{- Check Prime numbers  -}

-- список делителей числа 
getDivisors num
  | num < 1 = []
  | otherwise = [x | x <- [1..num], num `mod` x == 0 ]

-- проверка на простоту 
isPrime num
  | num <= 1 = False
  | otherwise = getDivisors num == [1,num]

-- получить список простых чисел
-- Чтобы получить первые 10 последовательностей, нужно передать генератор функции take 10.
allPrimeNumbers = [2] ++ filter isPrime [3,5..]

