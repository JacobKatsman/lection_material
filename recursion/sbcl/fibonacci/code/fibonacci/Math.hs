module Math where

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)


-- The memoized version is much faster. Try memoized_fib 10000.
-- http://wiki.haskell.org/Memoization
-- http://lin-techdet.blogspot.com/2015/07/haskell.html

memoized_fib :: Int -> Integer
memoized_fib = (map fib [0 ..] !!)
   where fib 0 = 0
         fib 1 = 1
         fib n = memoized_fib (n-2) + memoized_fib (n-1)
