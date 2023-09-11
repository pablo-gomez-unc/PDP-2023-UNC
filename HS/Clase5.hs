import System.IO

act :: IO (Char, Char)
act = do x <- getChar
         putChar x
         getChar
         y <- getChar
         return (x,y)

leerLinea :: IO ()
leerLinea = do x <- getLine
               putStrLn x 
--             return ()

strLen :: IO ()
strLen = do putStr "Ingrese un string: "
            xs <- getLine
            putStr "El string tiene "
            putStr (show (length xs))
            putStrLn " caracteres"


ahorcado :: IO()
ahorcado = do putStrLn "Piensa una palabra: "
              palabra <- getPalabra
              putStrLn "Intenta adivinarla: "
              jugar palabra

getPalabra :: IO String
getPalabra = do x <- getChNoEcho
                if x == '\n' then 
                    do  putChar x
                        return []
                else 
                    do  putChar '-'
                        xs <- getPalabra
                        return (x:xs)

getChNoEcho :: IO Char
getChNoEcho= do hSetEcho stdin False
                x <- getChar
                hSetEcho stdin True
                return x

jugar :: String -> IO ()
jugar palabra = 
    do  putStr "? "
        intento <- getLine
        if intento == palabra then 
            putStrLn "Adivinaste! "
        else
            do  putStrLn (match palabra intento)
                jugar palabra

match :: String -> String -> String
match xs ys = [if elem x ys then x else '-' | x <- xs]


