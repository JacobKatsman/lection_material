module Math where

{-  https://metanit.com/cpp/tutorial/2.6.php -}
{-  Операция получения остатка от целочисленного деления:

ghci> 17 `rem` 3
ghci> = 2
ghci> :q
Leaving GHCi.

ghci> 15  `quot` 4
3

-}
{-  https://codelab.ru/source/cpp/common_divisor:recursive_euclid -}

-- показать как работает алгоритм - трассировка

{- greatest common divisor -}
my_gcd :: Integral a => a -> a -> a
my_gcd 0 0 = error "GCD not defined (НОД)"
my_gcd x y | y == 0     =  x
           | otherwise  =  my_gcd y (rem x y)  

{- Least Common Multiple -}
my_lcm :: Integral a => a -> a -> a
my_lcm 0 0 = error "LCM not defined (НОК)"
my_lcm _ 0 = 0
my_lcm 0 _ = 0
my_lcm m n = abs ((m `quot` (my_gcd m n)) * n)
