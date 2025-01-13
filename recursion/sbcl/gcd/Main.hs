module Main where

import System.Environment   
import Data.List  
import Math

--https://blog.skillfactory.ru/nok-i-nod-chisel-chto-eto-takoe-i-kak-ih-nayti/

-- Get  comman line argument.
getIntArg :: IO Int
getIntArg = fmap (read . head) getArgs

main = do  
    args <- getIntArg              -- IO [Int]
    putStrLn "The arguments GCD Numner are:"  
    print (my_gcd 252 441)
    putStrLn "The arguments LCM Numner are:"
    print (my_lcm 252 441)
