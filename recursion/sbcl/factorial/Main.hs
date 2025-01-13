module Main where

import System.Environment   
import Math

{- простейшее вычисление факториала -}
{- https://learnhaskellforgood.narod.ru/learnyouahaskell.com/types-and-typeclasses.html -}
{- https://www.cyberforum.ru/haskell/thread2808747.html -}

{-
Скомпилируем с флагом профилирования:
https://anton-k.github.io/ru-haskell-book/book/10.html

$ ghc --make Main.hs -rtsopts -prof -auto-all

cтатистика вычислителя показывает, что эта программа вызывала глубокую очистку 8 раз и выполняла полезную работу лишь 40% времени.

$ ./Main 6 +RTS -K30m -sstderr
...
                                    Tot time (elapsed)  Avg pause  Max pause
  Gen  0       493 colls,     0 par    0.26s    0.26s     0.0005s    0.0389s
  Gen  1         8 colls,     0 par    0.14s    0.20s     0.0248s    0.0836s
...
    Productivity  40.5% of total user, 35.6% of total elapsed

Теперь посмотрим на профиль кучи.

Теперь посмотрим на профиль кучи.

$ ./Main 6 +RTS -K30m -hc
(500000,500000)
$ hp2ps -e80mm -c Main.hp

-}

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

main = do  
    args <- getIntArg              -- IO [Int]
    putStrLn "The arguments are:"  
    print (factorial_fast args)

