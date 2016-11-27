module Main where

import Lib
import System.IO
import Type
import Conv
import Pool

toInt' :: String -> Int
toInt' s = read s :: Int

showMatrix :: Matrix' -> String
showMatrix m = unlines $ map (unwords . map show) m

main :: IO ()
main = do
  handle <- openFile "input/data3.txt" ReadMode
  s <- hGetContents handle
  let sList = words <$> lines s
      imgData = map (map toInt') sList
      filt = [[0,1,0], [0,1,0], [0,1,0]]
      convOut = conv' filt imgData
      poolOut = pooling convOut
  putStrLn $ showMatrix convOut
  putStrLn $ showMatrix poolOut
