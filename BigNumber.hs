--2.1
module BigNumber (BigNumber (..),
                  scanner,
                  output,
                  changeSign) where

import Data.Char(digitToInt)
type BigNumber = [Int]

--2.2
scanner' :: String -> BigNumber
scanner' xs = [digitToInt x | x <- xs]

scanner :: String -> BigNumber
scanner x  | head x == '-' = changeSign (map(\x -> read [x]) (tail x))
           | otherwise = scanner' x

changeSign :: BigNumber -> BigNumber
changeSign xs = [- x | x <- xs]

--2.3 
output :: BigNumber -> String
output a 
    | head a < 0 = "-" ++ output (changeSign a)
    | otherwise = concatMap show a

--2.4
somaBN :: BigNumber -> BigNumber -> BigNumber
somaBN n1 n2
    | head n1 > 0 && head n2 > 0 = somaBN' (reverse n1) (reverse n2) 0 []
    | head n1 < 0 && head n2 < 0 = changeSign (somaBN (changeSign n1) (changeSign n2))
    | head n1 > 0 && head n2 < 0 && (equalOrBiggerBN (changeSign n2) n1) = changeSign(somaBN (changeSign n2) (changeSign n1))
    | head n1 < 0 && head n2 > 0 && (equalOrBiggerBN (changeSign n1) n2) = changeSign(somaBN (changeSign n1) (changeSign n2))
    | otherwise = somaBN' (reverse n1) (reverse n2) 0 []

somaBN' :: BigNumber -> BigNumber -> Int -> BigNumber -> BigNumber
somaBN' n1 n2 decimal_seguinte res 
    | n1 == [] && n2 == [] && decimal_seguinte == 0 = remove0 res
    | n1 == [] && n2 == [] = decimal_seguinte:res
    | n1 == [] && n2 /= [] = somaBN' n1 (tail n2) (div (decimal_seguinte + head n2) 10) ((mod (decimal_seguinte + head n2) 10):res)
    | n1 /= [] && n2 == [] = somaBN' (tail n1) n2 (div (decimal_seguinte + head n1) 10) ((mod (decimal_seguinte + head n1) 10):res)
    | n1 /= [] && n2 /= [] = somaBN' (tail n1) (tail n2) (div (decimal_seguinte + head n1 + head n2) 10) ((mod (decimal_seguinte + head n1 + head n2) 10):res)

remove0 :: BigNumber -> BigNumber
remove0 n1 
    | n1 == [] = [0]
    | head n1 == 0 = remove0 (tail n1)
    | otherwise = n1

--2.5
equalOrBiggerBN :: BigNumber -> BigNumber -> Bool
equalOrBiggerBN n1 n2 
    | n1 == [] && n2 == [] = True
    | head n1 > 0 && head n2 < 0 = True --n2 negative n1 positive
    | head n1 < 0 && head n2 > 0 = False --n1 negative n2 positive
    | head n1 > 0 && head n2 > 0 && length n1 > length n2 = True --both positive, n1 larger
    | head n1 > 0 && head n2 > 0 && length n1 < length n2 = False --both positive, n2 larger
    | head n1 < 0 && head n2 < 0 && length n1 > length n2 = False --both negative, n1 larger
    | head n1 < 0 && head n2 < 0 && length n1 < length n2 = True --both negative, n2 larger
    | length n1 == length n2 && head n1 > head n2 = True --both positive, same size
    | length n1 == length n2 && head n1 < head n2 = False --both positive, same size
    | otherwise = equalOrBiggerBN (tail n1) (tail n2)
    
subBN ::BigNumber -> BigNumber -> BigNumber
subBN n1 n2 = somaBN n1 (changeSign n2)

multBN ::BigNumber -> BigNumber -> BigNumber
multBN n1 n2 
    | head n1 > 0 && head n2 > 0 = multBN' n1 n2 [0]
    | head n1 < 0 && head n2 < 0 = multBN' (changeSign n1) (changeSign n2) [0]
    | head n1 > 0 && head n2 <0 = changeSign (multBN' n1 (changeSign n2) [0])
    | head n1 < 0 && head n2 >0 = changeSign (multBN' (changeSign n1) n2 [0])

multBN'::BigNumber -> BigNumber -> BigNumber ->BigNumber
multBN' n1 n2 acc 
    | n2 == [0] = acc
    | n2 == [] = acc
    | otherwise = multBN' n1 (somaBN n2 [-1]) (somaBN n1 acc)

divBN :: BigNumber -> BigNumber -> (BigNumber, BigNumber)
divBN dividend divisor 
    | equalOrBiggerBN dividend divisor = divBN' dividend divisor divisor [1]
    | otherwise = ([0], dividend)

divBN' :: BigNumber -> BigNumber ->BigNumber-> BigNumber-> (BigNumber, BigNumber)
divBN' dividend divisor acc quotient
    | head (subBN dividend (somaBN acc divisor)) < 0 = (quotient, (subBN dividend acc))
    | otherwise = divBN' dividend divisor (somaBN acc divisor) (somaBN quotient [1])