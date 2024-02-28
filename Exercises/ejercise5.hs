-- con patrones de lista
init1 :: [a] -> [a]
init1 [_] = []
init1 (x:xs) = x : init1 xs

-- con funciones predefinidas como take y length
init2 :: [a] -> [a]
init2 xs = take (length xs - 1) xs
