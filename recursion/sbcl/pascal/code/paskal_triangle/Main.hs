module Main where

import Math

{- https://libeldoc.bsuir.by/bitstream/123456789/56340/1/Mychko_Treugol%27nik.pdf -}
{- http://mech.math.msu.su/~shvetz/54/inf/perl-examples/PerlExamples_PascalTriangle.xhtml -}
{- http://mech.math.msu.su/~vvb/Dush/Haskell/index.html -}
{- https://gist.github.com/gubatron/c690b46f72e0bb1bab378da8a49348c1 -}

listToString = unwords. map show
printTriangle n = mapM_ putStrLn (map listToString (makeTriangle 10))

main = printTriangle 10
