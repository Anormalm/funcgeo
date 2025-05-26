module Spiral (spiral) where

import Geometry

spiral :: Int -> Double -> Shape
spiral 0 _ = Group []
spiral n size =
  Group
    [ Rectangle (-size/2, -size/2) size size
    , Rotate 15 (Scale 0.95 0.95 (spiral (n - 1) size))
    ]