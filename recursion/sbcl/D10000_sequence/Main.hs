module Main where

import System.Environment   
import D10000

getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

main = do
        args <- getIntArg              -- IO [Int]
        print (douglasHofstadter args)
