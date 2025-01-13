module Main where

import System.Environment   
import Data.List  
import Math

{- Collatz conjecture number -}
{- https://en.wikipedia.org/wiki/Collatz_conjecture -}
{- https://en.wikibooks.org/wiki/Haskell/Control_structures -}

-- Get  comman line argument.
getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

main = do  
    args <- getIntArg              -- IO [Int]
    putStrLn "The arguments Collatz Numner are:"  
    print (collatz args)
