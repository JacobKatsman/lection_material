module Main where

{- Cписок Чисел Мерсенна -}
{- https://ru.wikipedia.org/wiki/Число Мерсенна -}

import System.Environment   
import Math
import Mersen

getIntArg :: IO Integer
getIntArg = fmap (read . head) getArgs

tPrimе :: Integer -> [Integer]
tPrimе x = (take (fromIntegral x)  $ allPrimeNumbers)
        
main = do  
    args <- getIntArg                       -- IO [Int]
    putStrLn " Mersen number list:"
    print (mersen  (fromIntegral (length (tPrimе (fromIntegral args))))
                                         (tPrimе (fromIntegral args))
          ) 
                                        
          
