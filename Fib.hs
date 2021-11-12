fibRec :: (Integral a) => a -> a
fibRec n
    | n == 0 = 0 
    | n == 1 = 1
    | otherwise = fibRec (n-1) + fibRec(n-2)

fibLista :: (Integral a) => Int -> a
fibLista i = (fibLista' i [0,1])!!i

fibLista':: (Integral a) => Int->[a]->[a] 
fibLista' n l
    | n < 2 = l
    | n > 1 = fibLista' n-1 + fibLista' l++[l!!(n-1) + l!!(n-2)]

fibListaInfinita :: (Integral a) => Int -> a
fibListaInfinita i = fibs!!i
    where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)

