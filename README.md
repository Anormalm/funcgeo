# funcgeo

**funcgeo** is a mini generative art engine written in Haskell.  
It defines a pure functional DSL for composing geometric shapes and renders them as SVG.

This project was built for fun, expressiveness, and artistic exploration in pure code.


## Features

- Pure functional geometry: `Circle`, `Rectangle`, `Translate`, `Rotate`, `Scale`, `Mirror`
- Composition combinators: `Group`, `above`, `beside`, `repeatH`
- Recursive fractal structures
- Generative spiral, tree, and tile art
- SVG output from Haskell
- Modular project structure for extension



## Examples

### Fractal Tree

```haskell
Translate 300 580 (fractalTree 6 80)
```

⸻

Spiral
```haskell
Translate 300 300 (spiral 50 100)
```
To generate new artwork, edit Main.hs and run stack exec funcgeo-exe

⸻

How to Use

Prerequisites
	•	Install Haskell Stack

Build and Run

git clone https://github.com/Anormalm/funcgeo.git
cd funcgeo-art
stack build
stack exec funcgeo-exe

Generated files will appear in the output/ folder.

