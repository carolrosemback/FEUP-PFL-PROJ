import BigNumber

fibRec :: (Integral a) => a -> a
fibRec n = fibRec' n 0 1

fibRec' :: (Integral a) => a -> a -> a -> a
fibRec' n fib_2 fib_1
    | n == 0 = fib_2
    | n == 1 = fib_1
    | otherwise = fibRec' (n -1) fib_1 (fib_2 + fib_1)


fibLista :: (Integral a) => Int -> a
fibLista i = (fibLista' i 1 [0,1])!!i

fibLista':: (Integral a) => Int->Int->[a]->[a] 
fibLista' n c l
    | n < 2 = l
    | n == c = l
    | n > c = fibLista' n (c+1) (l ++ [l!!c + l!!(c-1)])


fibListaInfinita :: (Integral a) => Int -> a
fibListaInfinita i = fibs!!i
    where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

fibRecBN :: BigNumber -> BigNumber
fibRecBN n = fibRecBN' n [0] [1]

fibRecBN' :: BigNumber -> BigNumber -> BigNumber -> BigNumber
fibRecBN' n fib_2 fib_1
    | n == [0] = fib_2
    | n == [1] = fib_1
    | otherwise = fibRecBN' (somaBN n [-1]) fib_1 (somaBN fib_2 fib_1)

fibListaBN :: BigNumber -> BigNumber
fibListaBN n = last (fibListaBN' n 1 [[0],[1]])

fibListaBN':: BigNumber->Int->[BigNumber]->[BigNumber] 
fibListaBN' n count lis
    | head (subBN n [2]) < 0 = lis
    | output n == show count = lis
    | otherwise = fibListaBN' n (count + 1) (lis ++ [somaBN (lis!!count) (lis!!(count-1))])

fibListaInfinitaBN :: BigNumber -> BigNumber
fibListaInfinitaBN n = fibs!!(bnToInteger n)
    where fibs = [0] : [1] : zipWith (somaBN) fibs (tail fibs)