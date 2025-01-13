module Main where

import System.Environment   
import Bell

-- Get  comman line argument.
getIntArg :: IO Integer
getIntArg = fmap (read . head) getArgs

main = do
        args <- getIntArg              -- IO [Int]
        print (makeBell args)
