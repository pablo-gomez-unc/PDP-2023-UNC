quickSort :: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort ys  ++ [x] ++  quickSort zs
    where
        ys = [a | a <- xs, a <= x]
        zs = [b | b <- xs, b > x]

quickSortLambda :: Ord a => [a] -> [a]
quickSortLambda [] = []
quickSortLambda (x:xs) =  quickSortLambda ((\z -> [y | y <- xs, y <= z]) x)
                          ++ [x] ++
                          quickSortLambda ((\z -> [y | y <- xs, y >  z]) x)

quickSortFilter :: Ord a => [a] -> [a]
quickSortFilter [] = []
quickSortFilter (x:xs) = quickSortFilter (filter (<= x) xs)
                         ++ [x] ++
                         quickSortFilter (filter (> x) xs)

divisores :: Int -> [Int]
divisores n =  [x | x <- [1..n], n `mod` x == 0]

esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | otherwise = not (esDivisiblePorAlguno (n-1) n)
      where
        esDivisiblePorAlguno x n
          | x == 1 = False
          | mod n x == 0 = True
          | mod n x /= 0 = esDivisiblePorAlguno (x-1) n

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]

tuplasDeContiguos :: [a] -> [(a,a)]
tuplasDeContiguos [] = []
tuplasDeContiguos [_] = []
tuplasDeContiguos (x:y:xs) = (x,y) : tuplasDeContiguos (y:xs)
{-
isOrdenada :: Ord a => [a] -> Bool
isOrdenada [] = True
isOrdenada xs = all (\(x, y) -> x <= y) (tuplasDeContiguos xs)
-}

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

-- insert 2 [1,6,8] -> [1,2,6,8]
-- 1 : insert 2 [6,8]
-- 1 : 2 : [6,8]
-- insert 8 [1,6]
-- 1 :insert 8 [6]
-- 6 : insert 8 [] 
-- [8]
-- 1:6:8:[]
insert :: Int -> [Int] -> [Int]
insert n [] = [n]
insert n (x:xs) | x < n = x : insert n xs
                | otherwise = n : x : xs

-- isort [2,6,7,1,3]            = [1,2,3,6,7]
--    insert 2 (isort [6,7,1,3])= insert 2 [1,3,6,7] 
--    insert 6 (isort [7,1,3])  = insert 6 [1,3,7]
--    insert 7 (isort [1,3])    = insert 7 [1,3]
--    insert 1 (isort [3])      = insert 1 [3] 
--    insert 3 (isort [])       = insert 3 []
isort :: [Int] -> [Int]
isort [] = []
isort (x:xs) = insert x (isort xs)

-- splitAt