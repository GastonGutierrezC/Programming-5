--INSTRUCTIONS FOR ITS EXECUTION

--Open the terminal in the folder where you have the project and the file.
--Execute the command ghci
--Run the command :l Hanoi
--Run main and you will see the output of the test cases that are in the code

-- I define data types
type Peg = String
type Move = (Peg, Peg)

---- Function that checks if all disks are in the main tower 
allInTheMainTower :: Peg -> Peg -> Bool
allInTheMainTower a c = a == c

---- Principal function
hanoi :: Integer -> Peg -> Peg -> Peg -> [Move]
hanoi 0 _ _ _ = []  -- Base case: no disks
hanoi n a b c
    | allInTheMainTower a c && n > 0 = []  -- If all disks are in the central tower
    | otherwise =
        let
            -- Moves required to move n-1 disks from tower a to tower c using b as auxiliary tower
            step1moves = hanoi (n-1) a c b
            -- Motion required to move the remaining disk from tower a to tower b
            step2moves = (a, b)
            -- Moves needed to move n-1 disks from tower c to tower b using a as auxiliary tower
            step3moves = hanoi (n-1) c b a
        in
            -- Concatenation of the movements of the three previous steps
            step1moves ++ [step2moves] ++ step3moves


main :: IO ()
main = do
    putStrLn "Test 1: All disks in the target tower at the beginning of the test"
    let numDiscs1 = 3
    let moves1 = hanoi numDiscs1 "B" "B" "B"
    putStrLn "Movements:"
    print moves1
    putStrLn $ "Total movements: " ++ show (length moves1)

    putStrLn "\nTest 2: Only one disc"
    let numDiscs2 = 1
    let moves2 = hanoi numDiscs2 "A" "B" "C"
    putStrLn "Movements:"
    print moves2
    putStrLn $ "Total movements: " ++ show (length moves2)

    putStrLn "\nTest 3: More than one disk"
    let numDiscs3 = 2
    let moves3 = hanoi numDiscs3 "A" "B" "C"
    putStrLn "Movements:"
    print moves3
    putStrLn $ "Total movements: " ++ show (length moves3)

    putStrLn "\nTest 4: Initial configuration on different towers"
    let numDiscs4 = 3
    let moves4 = hanoi numDiscs4 "A" "B" "C"
    putStrLn "Movements:"
    print moves4
    putStrLn $ "Total movements: " ++ show (length moves4)
