module Render (render, wrapSVG, writeSVG) where

import Geometry
import System.IO

render :: Shape -> String
render (Circle (x, y) r) =
  "<circle cx=\"" ++ show x ++ "\" cy=\"" ++ show y ++ "\" r=\"" ++ show r ++ "\" fill=\"none\" stroke=\"black\" />"
render (Rectangle (x, y) w h) =
  "<rect x=\"" ++ show x ++ "\" y=\"" ++ show y ++ "\" width=\"" ++ show w ++ "\" height=\"" ++ show h ++ "\" fill=\"none\" stroke=\"black\" />"
render (Translate dx dy s) =
  "<g transform=\"translate(" ++ show dx ++ "," ++ show dy ++ ")\">" ++ render s ++ "</g>"
render (Scale sx sy s) =
  "<g transform=\"scale(" ++ show sx ++ "," ++ show sy ++ ")\">" ++ render s ++ "</g>"
render (Rotate angle s) =
  "<g transform=\"rotate(" ++ show angle ++ ")\">" ++ render s ++ "</g>"
render (MirrorX s) =
  "<g transform=\"scale(-1, 1)\">" ++ render s ++ "</g>"
render (MirrorY s) = 
  "<g transform=\"scale(1, -1)\">" ++ render s ++ "</g>"
render (Group shapes) =
  concatMap render shapes

wrapSVG :: String -> String
wrapSVG content =
  "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"500\" height=\"500\">\n" ++ content ++ "\n</svg>"

writeSVG :: FilePath -> Shape -> IO ()
writeSVG path shape = do
    let svg = wrapSVG (render shape)
    writeFile path svg
    putStrLn $ "SVG written to " ++ path