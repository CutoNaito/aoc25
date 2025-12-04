len :: String -> Int
len = length . takeWhile (/= '\n')

removeNl :: String -> String
removeNl = filter (/= '\n')

numOfOccurences :: String -> Int -> Int -> Int
numOfOccurences s i line = length $ filter (== '@') neighbors
    where
        n = length s
        row = i `div` line
        col = i `mod` line

        indices = [i-1, i+1, i-line, i+line, i-line-1, i-line+1, i+line-1, i+line+1]

        validIndex j = j >= 0 && j < n &&
            let r = j `div` line
                c = j `mod` line
            in abs (r - row) <= 1 && abs (c - col) <= 1

        neighbors = [ s !! j | j <- indices, validIndex j ]

countOccurences :: String -> Int -> Int
countOccurences s line =
    length [ i | i <- [0 .. length s - 1], s !! i == '@', numOfOccurences s i line < 4 ]

part1 = do
    let file = "./input"
    contents <- readFile file
    print (countOccurences (removeNl contents) (len contents))

main = do
    part1
