-- Kurt Slagle
-- EECS 368 - Homework 5 - Primes using the Sieve and 3,5,7 Hamming numbers
-- 5/7/15

merge2 :: [Int] -> [Int] -> [Int]
merge2 (x:l) (y:t)
    |x < y = x:merge2 l (y:t)
    |x > y = y:merge2 (x:l) t
    |x == y = x: merge2 l t
merge2 x [] = x
merge2 [] y = y

hamming :: [Int]
hamming = 1 : (merge2( map (3*) hamming) (merge2( map (5*) hamming) (map (7*) hamming)))

sieve :: Integral a => [a] -> [a]
sieve (p : xs) = p : sieve [x | x <- xs, x `mod` p /= 0]

primes :: [Int]
primes = sieve [2..]

-- to get the 1000th prime, type "primes!!999" - the 1000th prime is 7919, and the primes start at 2
-- to get the 1000th hamming number, type "hamming!!1000"
