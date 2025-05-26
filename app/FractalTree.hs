module FractalTree (fractalTree) where

import Geometry
import Debug.Trace (trace)

fractalTree :: Int -> Double -> Shape
fractalTree 0 _ = trace "Base case" $ Group []
fractalTree depth len = trace ("Depth: " ++ show depth ++ ", Length: " ++ show len) $
      Group
        [ Rectangle (-2, -len) 4 len
        , Translate 0 (-len)
            (Group
              [ Rotate (-30) (Scale 0.7 0.7 (fractalTree (depth -1) len))
              , Rotate (30) (Scale 0.7 0.7 (fractalTree (depth -1) len))
              ])
        ]