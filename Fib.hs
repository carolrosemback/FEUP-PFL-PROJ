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
