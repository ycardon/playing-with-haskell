module Conway where

import Data.List (group)

-- | suite de Conway (https://fr.wikipedia.org/wiki/Suite_de_Conway)
conway :: Int -> [Int]
conway 0 = [1]
conway n = concatMap (\x -> [length x, head x]) . group . conway $ (n - 1)

---- PROPRITETES DE LA SUITE

-- | aucun terme de la suite ne comporte un chiffre >3
property1 :: Int -> Bool
property1 = all (<= 3) . conway

-- | tous les termes de la suite possèdent un nombre pair de chiffre
property2 :: Int -> Bool
property2 = even . length . conway

-- | les termes de rang impair se terminent par 21 et les termes de rang pair par 11
property3 :: Int -> Bool
property3 x =
  if even x
    then (== [2, 1]) . takeR 2 . conway $ x
    else (== [1, 1]) . takeR 2 . conway $ x
  where
    takeR n = reverse . take n . reverse