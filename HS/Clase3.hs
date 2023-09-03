quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = (quickSort ys)  ++ [x] ++  (quickSort zs)
    where
        ys = [a | a <- xs, a <= x]
        zs = [b | b <- xs, b > x]

divisores :: Int -> [Int]
divisores n =  [x | x <- [1..n], n `mod` x == 0]

esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | otherwise = not(esDivisiblePorAlguno (n-1) n)
      where 
        esDivisiblePorAlguno x n
          | x == 1 = False
          | (mod n x) == 0 = True
          | (mod n x) /= 0 = esDivisiblePorAlguno (x-1) n

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]

tuplasDeContiguos :: [a] -> [(a,a)]
tuplasDeContiguos [] = []
tuplasDeContiguos [_] = []
tuplasDeContiguos (x:y:xs) = (x,y) : tuplasDeContiguos (y:xs)

isOrdenada :: Ord a => [a] -> Bool
isOrdenada [] = True
isOrdenada xs = all (\(x, y) -> x <= y) (tuplasDeContiguos xs)

isOrdenada :: Ord a => [a] -> Bool
isOrdenada [] = True
isOrdenada (x:y:xs) | x > y = False
                    | otherwise = isOrdenada (y:xs)  

indices :: Eq a => [a] -> a -> [Int]
indices xs valor = indicesAux xs 0
  where
    indicesAux [] _ = []
    indicesAux (x:xs) n
      | x == valor = n : indicesAux xs (n + 1)
      | otherwise = indicesAux xs (n + 1)

largo :: [a] -> Int
largo [] = 0
largo (x:xs) = 1 + largo xs 

invertir :: [a] -> [a]
invertir [] = []
invertir (x:xs) = invertir xs ++ [x]

todos :: [Bool] -> Bool
todos [] = True
todos (x:xs) 
  | x == False = False
  | otherwise = todos xs 

concatenar :: [[a]] -> [a]
concatenar [] = []
concatenar (xs:xss) = xs ++ concatenar xss

listaDeNElementos :: Int -> a -> [a]
listaDeNElementos 0 _ = []
listaDeNElementos n x = x : listaDeNElementos (n - 1) x

(!!!) :: [a] -> Int -> a
(!!!) (x:_) 0 = x
(!!!) (_:xs) n = (!!!) xs (n - 1)
(!!!) [] _ = error "Índice fuera de rango"

pertenece :: Eq a => a -> [a] -> Bool
pertenece _ [] = False
pertenece elemento (x:xs)
  | elemento == x = True
  | otherwise = pertenece elemento xs


