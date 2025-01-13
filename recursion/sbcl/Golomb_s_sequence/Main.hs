module Main where

-- https://downloads.haskell.org/~ghc/6.12.2/docs/html/users_guide/assertions.html

import System.Environment   
import Golombs

getIntArg :: IO Integer
getIntArg = fmap (read . head) getArgs

main = do
        args <- getIntArg              -- IO [Int]
        print (makeGolombs args)
