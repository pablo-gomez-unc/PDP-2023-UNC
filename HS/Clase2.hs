import Data.List (isInfixOf)


pares :: [Int] -> [Int]
pares xs =  [x | x <- xs, x `mod` 2 == 0]

contiene :: [[Char]] -> [Char] -> [[Char]]
contiene xss sb = [ xs | xs <- xss, isInfixOf sb xs]

esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | otherwise = all (\x -> mod n x /= 0) [2..(n-1)]

{-
esPrimo :: Int -> Bool
esPrimo n
    | n <= 1 = False
    | otherwise = not(esDivisiblePorAlguno (n-1) n)
      where 
        esDivisiblePorAlguno x n
          | x == 1 = False
          | (mod n x) == 0 = True
          | (mod n x) /= 0 = esDivisiblePorAlguno (x-1) n
-}

primos :: [Int] -> [Int]
primos xs = [x | x <- xs, esPrimo x]




abs :: Int -> Int
abs n = if n>= 0 then  n else -n
{-
abs n | n>=0 = n
      | otherwise = -n
-}

(&&) :: Bool -> Bool -> Bool
True && True = True
True && False = False
False && True = False
False && False = False
{-
True && True = True
_ && _ = False
-}
{-
True && b = b
False && _ = False
-}

impares n = map f [0..n-1]
          where 
            f x  = x*2 + 1
{-
impares n = map (\x -> x*2 + 1) [0..n-1]
-}

signo :: Int -> Int
signo n = if n>0 then 1 else
            if n==0 then 0 else -1

sumarUno :: Int -> Int
sumarUno = (+ 1)

multiplicarPorTres :: Int -> Int
multiplicarPorTres = (3 *)

dividirDos :: Float -> Float
dividirDos = (2 /)

dividirPorDos :: Float -> Float
dividirPorDos = (/ 2)

esMayorA10 :: Int -> Bool
esMayorA10 = (> 10)

sumaDos :: Int -> Int
sumaDos = (+) 2