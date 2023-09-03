module Programa1 where

myLast :: [a] -> a
myLast [] = error "No hay elementos"
myLast [x] = x
myLast (_:xs) = myLast xs


myLastByOne :: [a] -> a
myLastByOne [] = error "No hay elementos"
myLastByOne [_] = error "Un solo elemento" 
myLastByOne [x,_] = x
myLastByOne (_:xs) = myLastByOne xs

elementAt :: [a] -> Int -> a
elementAt [] _ = error "Indice fuera de rango"
elementAt (x:_) 1 = x
elementAt (_:xs) n 
    | n < 1 = error "Indice fuera de rango"
    | otherwise = elementAt xs (n-1)
 
myLength :: [a] -> Int
myLength [] = 0
myLength [_] = 1
myLength (x:xs) = 1 + myLength xs 

myReverse :: [a] -> [a]
myReverse [] = []
myReverse [x] = [x]
myReverse (x:xs) = (myReverse xs) ++ [x]

isPalindrome :: Eq a => [a] -> Bool
isPalindrome [] = True
isPalindrome [_] = True
isPalindrome (x:xs)
    | x == last xs = isPalindrome (init xs)
    | otherwise    = False

isPalindrome' :: Eq a => [a] -> Bool
isPalindrome' xs = xs == reverse xs

data NestedList a = Elem a | List [NestedList a]
flatten :: NestedList a -> [a]
flatten (Elem x) = [x]
flatten (List xs) = concatMap flatten xs

compress :: Eq a => [a] -> [a]
compress [] = []
compress [x] = [x]
compress (x:y:xs) 
    | x == y = compress (y:xs)
    | otherwise = x : compress (y:xs) 

pack :: Eq a => [a] -> [[a]]
pack [] = []
pack (x:xs) = (x : takeWhile (== x) xs) : pack (dropWhile (== x) xs)