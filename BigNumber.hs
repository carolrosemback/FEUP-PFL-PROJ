--2.1
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
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN n1 n2 = reverse (somaBN' n1 n2 0 [])

somaBN' :: BigNumber -> BigNumber -> Int -> BigNumber -> BigNumber
somaBN' n1 n2 decimal_seguinte res =
    if n1 == [] then
        (if n2 == [] then
            (if decimal_seguinte == 0 then
                res
                    else
                decimal_seguinte:res
            )
                else
            somaBN' n1 (tail n2) (div (decimal_seguinte + head n2) 10) ((mod (decimal_seguinte + head n2) 10):res)
        )
    else
        (if n2 == [] then
            somaBN' (tail n1) n2 (div (decimal_seguinte + head n1) 10) ((mod (decimal_seguinte + head n1) 10):res)
                else
            somaBN' (tail n1) (tail n2) (div (decimal_seguinte + head n1 + head n2) 10) ((mod (decimal_seguinte + head n1 + head n2) 10):res)
        )


--2.5
--subBN ::BigNumber -> BigNumber -> BigNumber

--2.6
--mulBN :: BigNumber -> BigNumber -> BigNumber

--2.7
--divBN :: BigNumber -> BigNumber -> (BigNumber, BigNumber)