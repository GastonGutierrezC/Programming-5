split :: String -> Char -> [String]
split [] _ = []
split (x:xs) c =
    if x == c
        then split xs c 
        else (x : takeWhile (/= c) xs) : split (dropWhile (/= c) xs) c
