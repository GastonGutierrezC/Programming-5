-- términos de las funciones de la biblioteca
last1 :: [a] -> a
last1 xs = head (reverse xs)

-- utilizando recursión y coincidencia de patrones
last2 :: [a] -> a
last2 [x] = x
last2 (_:xs) = last2 xs
