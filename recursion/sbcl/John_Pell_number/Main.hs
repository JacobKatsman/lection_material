module Main where

{- Числа Пелля -}
{- https://ru.wikipedia.org/wiki/Пелл,_Джон -}

import System.Environment   
import Math

getIntArg :: IO Integer
getIntArg = fmap (read . head) getArgs

main = do  
    args <- getIntArg                       -- IO [Int]
    putStrLn "Pell number calculate :"  
    print (makePell args)
