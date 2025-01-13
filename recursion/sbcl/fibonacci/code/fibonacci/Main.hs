module Main where

import System.Environment   
import Data.List  
import Math

{- https://stackoverflow.com/questions/1105765/generating-fibonacci-numbers-in-haskell -}

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

main = do  
    args <- getIntArg              -- IO [Int]
    putStrLn "The arguments are:"  
    print (fib args)
