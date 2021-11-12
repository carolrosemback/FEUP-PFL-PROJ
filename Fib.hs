fibRec :: (Integral a) => a -> a
fibRec n
    | n == 0 = 0 
    | n == 1 = 1
    | otherwise = fibRec (n-1) + fibRec(n-2)

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

