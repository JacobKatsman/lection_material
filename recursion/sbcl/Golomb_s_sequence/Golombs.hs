module Golombs where

-- https://en.wikipedia.org/wiki/Golomb_sequence
-- a(1)=1;a(n+1)=1+a(n+1-a(a(n)))

-- https://projecteuler.net/problem=341
-- https://euler.jakumo.org/problems/view/341.html
-- Последовательность Голомба с самоописанием, {G(n)} - это такая единственная неубывающая последовательность натуральных чисел, в которой n появляется ровно G(n) раз. Значения G(n) для первых нескольких n даны ниже:

-- n       1   2   3   4   5   6   7   8   9   10  11  12  
-- G(n)    1   2   2   3   3   4   4   4   5   5   5   6   

-- https://senjun.ru/courses/haskell/chapters/haskell_chapter_0110/
-- https://senjun.ru/courses/haskell/chapters/haskell_chapter_0150/#block-add-dependency

-- оно _мягко сказать_ не очень эффективно, но здесь простота над оптимальностью
golombs :: Integral a => a -> a  
golombs n     |    n == 1    =  1 
              |    otherwise = 1 + (golombs (n - golombs (golombs(n - 1))))


-- вывести все числа Golomb's
-- должно быть реализано в стиле см. hofstrader-Q function
makeGolombs :: Integer -> [Integer]
makeGolombs  n = [ (golombs x) | x <- [1..n]]




