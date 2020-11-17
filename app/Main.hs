module Main where

import Control.Monad (forM_)
import Conway (conway)

main :: IO ()
main = do
  putStrLn "Conway suite"
  forM_ [0 .. 12] (print . conway)
