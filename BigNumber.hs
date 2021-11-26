module BigNumber (BigNumber (..),
                  scanner,
                  output,
                  changeSign) where

import Data.Char(digitToInt)
type BigNumber = [Int]

--2.2
scanner' :: String -> BigNumber
scanner' xs = reverse [digitToInt x | x <- xs]

scanner :: String -> BigNumber
scanner x  | head x == '-' = reverse (changeSign (map(\x -> read [x]) (tail x)))
           | otherwise = scanner' x

changeSign :: BigNumber -> BigNumber
changeSign (x:xs) = (-x):xs

--2.3 
output :: BigNumber -> String
output a = concatMap show (reverse a)


--2.4
--somaBN :: BigNumber -> BigNumber -> BigNumber



--2.5
--subBN ::BigNumber -> BigNumber -> BigNumber

--2.6
--mulBN :: BigNumber -> BigNumber -> BigNumber

--2.7
--divBN :: BigNumber -> BigNumber -> (BigNumber, BigNumber)