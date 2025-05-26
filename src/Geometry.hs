module Geometry where


type Point = (Double, Double)

data Shape
  = Circle Point Double        -- center and radius
  | Rectangle Point Double Double  -- top-left, width, height
  | Translate Double Double Shape
  | Scale Double Double Shape
  | Rotate Double Shape
  | MirrorX Shape
  | MirrorY Shape
  | Group [Shape]
  deriving (Show)


beside :: Shape -> Shape -> Shape
beside a b = Group [Translate (-50) 0 a, Translate 50 0 b]

above :: Shape -> Shape -> Shape
above a b = Group [Translate 0 (-50) a, Translate 0 50 b]

repeatH :: Int -> Shape -> Shape
repeatH n shape = Group [Translate (fromIntegral i * 60) 0 shape | i <- [0..n-1]]

scale :: Double -> Shape -> Shape
scale factor shape =
  Group [Translate 0 0 shape] 

