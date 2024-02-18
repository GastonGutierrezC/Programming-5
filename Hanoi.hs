--INSTRUCTIONS FOR ITS EXECUTION

--Open the terminal in the folder where you have the project and the file.
--Execute the command ghci
--Run the command :l Hanoi
--Run main and you will see the output of the test cases that are in the code

-- I define data types
type Peg = String
type Move = (Peg, Peg)

-- Función que verifica si todos los discos están en la torre destino
todosEnTorreDestino :: Peg -> Peg -> Bool
todosEnTorreDestino a c = a == c

-- Función principal que resuelve el problema de las Torres de Hanoi
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []  -- Caso base: no hay discos, por lo que no hay movimientos
hanoi n a b c
    | todosEnTorreDestino a c && n > 0 = []  -- Si todos los discos están en la torre destino y hay al menos un disco, no se requieren movimientos
    | otherwise =
        let
            -- Movimientos necesarios para mover n-1 discos de la torre a a la torre c usando b como torre auxiliar
            step1moves = hanoi (n-1) a c b
            -- Movimiento necesario para mover el disco restante de la torre a la torre b
            step2moves = (a, b)
            -- Movimientos necesarios para mover n-1 discos de la torre c a la torre b usando a como torre auxiliar
            step3moves = hanoi (n-1) c b a
        in
            -- Concatenación de los movimientos de los tres pasos anteriores
            step1moves ++ [step2moves] ++ step3moves

-- Función principal de la aplicación
main :: IO ()
main = do
    -- Prueba 1: Todos los discos en la torre de destino al principio
    putStrLn "Prueba 1: Todos los discos en la torre de destino al principio"
    let numDiscs1 = 3
    let moves1 = hanoi numDiscs1 "B" "A" "B"  -- Todos los discos están en la torre destino "B"
    putStrLn "Movimientos:"
    print moves1
    putStrLn $ "Total de movimientos: " ++ show (length moves1)

    -- Prueba 2: Solo un disco
    putStrLn "\nPrueba 2: Solo un disco"
    let numDiscs2 = 1
    let moves2 = hanoi numDiscs2 "A" "B" "C"
    putStrLn "Movimientos:"
    print moves2
    putStrLn $ "Total de movimientos: " ++ show (length moves2)

    -- Prueba 3: Más de un disco
    putStrLn "\nPrueba 3: Más de un disco"
    let numDiscs3 = 2
    let moves3 = hanoi numDiscs3 "A" "B" "C"
    putStrLn "Movimientos:"
    print moves3
    putStrLn $ "Total de movimientos: " ++ show (length moves3)

    -- Prueba 4: Configuración inicial en diferentes torres
    putStrLn "\nPrueba 4: Configuración inicial en diferentes torres"
    let numDiscs4 = 3
    let moves4 = hanoi numDiscs4 "A" "B" "C"
    putStrLn "Movimientos:"
    print moves4
    putStrLn $ "Total de movimientos: " ++ show (length moves4)
