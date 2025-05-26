module Main where

import Geometry
import Render
-- import FractalTree

-- main :: IO ()
-- main = do
--   let tree = Translate 300 580 (fractalTree 20 100)
--   writeSVG "output/tree.svg" tree
import Spiral

main :: IO ()
main = do
  let shape = Translate 300 300 (spiral 50 100)
  writeSVG "output/spiral.svg" shape