module Main where

import System.Environment   
import Recaman

-- Get  comman line argument.
getIntArg :: IO Integer
getIntArg = fmap (read . head) getArgs

main = do
        args <- getIntArg              -- IO [Int]
        print (recaman args)

