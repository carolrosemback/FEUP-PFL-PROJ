fibRec :: (Integral a) => a -> a
fibRec 0 = 0
fibRec 1 = 1
fibRec x = fibRec (x-1) + fibRec(x-2)

fibLista :: (Integral a) => a -> a
fibLista n = fibs !! n
    where fibs = 0 : 1 : zipWith (+) fibs (tail fibs)