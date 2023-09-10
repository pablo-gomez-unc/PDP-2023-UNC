twice :: (a -> a) -> a -> a
twice f x = f (f x)

sumador :: Int -> (Int -> Int)
sumador n = (\x -> x + n)

miMap :: (a->b)->[a]->[b]
-- miMap f xs = [f x | x <- xs]
miMap f [] = []
miMap f (x:xs) = f x : miMap f xs

miFilter :: (a -> Bool) -> [a] -> [a]
-- miFilter p xs = [x | x <- xs , p x]
miFilter p [] = []
miFilter p (x:xs) | p x = x : miFilter p xs
                  | otherwise = miFilter p xs

miSum [] = 0
miSum (x:xs) = x + miSum xs 
-- foldr (+) 0 

miProd [] = 1
miProd (x:xs) = x * miProd xs 
-- foldr (*) 1 

miLength :: [a] -> Int
miLength [] = 0
miLength (_:xs) = 1 + miLength xs
-- foldr (\_ n -> 1 + n) 0 [1,2,3]

miReverse [] = []
miReverse (x:xs) = miReverse xs ++ [x]
-- foldr (\x xs -> xs ++ [x]) []

miOdd :: Int -> Bool
miOdd = not . even

miAll :: (a -> Bool) -> [a] -> Bool
miAll p xs = and [p x | x <- xs]

miAny :: (a -> Bool) -> [a] -> Bool
miAny p xs = or [p x | x <- xs]

miTakeWhile :: (a->Bool) -> [a] -> [a]
miTakeWhile p [] = []
miTakeWhile p (x:xs) 
    | p x  = x : miTakeWhile p xs
    | otherwise = []

miDropWhile :: (a->Bool) -> [a] -> [a]
miDropWhile p [] = []
miDropWhile p (x:xs) 
    | p x  = miDropWhile p xs
    | otherwise = x:xs

type Pos = (Int,Int)
origin :: Pos
origin = (0,0)
left :: Pos -> Pos
left (x,y) = (x-1, y)

type Par a = (a,a)
mult :: Par Int -> Int
mult (m,n) = m * n
copy :: a -> Par a
copy x = (x,x)

data Respuesta = Si | No | Indefinido
respuestas :: [Respuesta]
respuestas = [Si, No , Indefinido]
cambiar :: Respuesta -> Respuesta
cambiar Si  = No
cambiar No = Si
cambiar Indefinido = Indefinido

data Forma = Circulo Float | Rect Float Float deriving Show
cuadrado :: Float -> Forma
cuadrado n = Rect n n 
area :: Forma -> Float
area (Circulo r) = pi * r^2
area (Rect x y ) = x * y

safeDivide :: Int -> Int -> Maybe Int
safeDivide _ 0  = Nothing
safeDivide a b = Just (a `div` b)

safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead xs = Just (head xs)

data Nat = Zero | Suc Nat
instance Show Nat where
    show :: Nat -> String
    show Zero = "Cero"
    show (Suc n) = "Sucesor(" ++ show n ++ ")"

nat2int :: Nat -> Int
nat2int Zero = 0
nat2int (Suc n) = 1 + nat2int n
int2nat :: Int -> Nat
int2nat 0 = Zero
int2nat n = Suc (int2nat (n-1))
addNat :: Nat -> Nat -> Nat
addNat Zero n = n
addNat (Suc m) n = Suc (addNat m n)

-- Reescribir la siguiente expresión utilizando map y filter
-- [f x | x <- xs , p x] --  f = (+2)   p = (>0) -- [-1,0,1] -- [3]
expresion f p xs = map f (filter p xs)

-- drop 2 [1,2,3] = [3]
miDrop :: Int -> [a] -> [a]
miDrop 0 xs = xs 
miDrop n (x:xs) = miDrop (n-1) xs

-- init [1,2,3] = [1,2]
miInit :: [a] -> [a]
miInit [_] = []
miInit (x:xs) = x : miInit xs


