module BigNumber (BigNumber (..),
                  scanner,
                  output) where

import Data.Char(digitToInt)
type BigNumber = [Int]

--2.2
scanner :: String -> BigNumber
scanner input = reverse [digitToInt a | a <- input]

--2.3 
output :: BigNumber -> String
output numb =  reverse (concatMap show numb)

--2.4
--somaBN :: BigNumber -> BigNumber -> BigNumber

--2.5
--subBN ::BigNumber -> BigNumber -> BigNumber

--2.6
--mulBN :: BigNumber -> BigNumber -> BigNumber

--2.7
--divBN :: BigNumber -> BigNumber -> (BigNumber, BigNumber)