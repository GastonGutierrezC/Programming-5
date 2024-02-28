-- Standard prelude

usingHead = head [1,2,3,4,5] -- Resultado: 1

usingTail = tail [1,2,3,4,5] -- Resultado: [2,3,4,5]

usingIndex = [1,2,3,4,5] !! 2 -- Resultado: 3 (índice 2)

usingTake = take 3 [1,2,3,4,5] -- Resultado: [1,2,3]

usingDrop = drop 3 [1,2,3,4,5] -- Resultado: [4,5]

usingLength = length [1,2,3,4,5] -- Resultado: 5

usingSum = sum [1,2,3,4,5] -- Resultado: 15

usingProduct = product [1,2,3,4,5] -- Resultado: 120

usingConcat = [1,2,3] ++ [4,5] -- Resultado: [1,2,3,4,5]

usingReverse = reverse [1,2,3,4,5] -- Resultado: [5,4,3,2,1]

--Funtion Aplication


f :: Int -> Int -> Int
f x y = x + y

a = 2
b = 3
c = 4
d = 5

resultado = f a b + c * d

-- Haskell scripts

double x = x + x

quadruple x = double (double x)

factorial n = product [1..n]
average ns = sum ns `div` length ns

--Naming requirements

sumarLista :: [Int] -> Int
sumarLista [] = 0
sumarLista (x:xs) = x + sumarLista xs

--The layout rule



esPar :: Int -> Bool
esPar x = if x `mod` 2 == 0
              then True
              else False


