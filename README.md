# Fuzzy

![Travis-CI Build Status](https://travis-ci.org/lepisma/Fuzzy.jl.svg)

Fuzzy Inference System in julia

###Install

`julia> Pkg.clone("git://github.com/lepisma/Fuzzy.jl.git")`

###QuickStart

`julia> using Fuzzy`

-	Create input, output membership functions and rules

```
julia> input_a = {"small" => Fuzzy.TriangularMF(1, 2, 3), "large" => Fuzzy.TriangularMF(4, 5, 6)}
julia> input_b = {"small" => Fuzzy.TriangularMF(1, 2, 3)}

julia> inputs = [input_a, input_b]
julia> output = {"small" => TriangularMF(1, 2, 3)}

julia> rule = Rule(["large", "small"], "small")
julia> rules = [rule]
```
    
-	Create FIS

```
julia> fis = FISMamdani(inputs, output, rules)
```

-	Find output

```
julia> in_vals = [4.7, 2.3]
julia> eval_fis(fis, in_vals)
```

###Features

-	FIS
	-	**Mamdani**
    -	*Sugeno (coming soon)*
-	Membership functions
	-	**Triangular**
    -	**Gaussian**
    -	**Bell**
    -	**Trapezoidal**
    -	**Sigmoid**
-	Defuzzification
	-	**Mean of Maximum**
    -	*Weighted Average (coming soon)*
    -	*Centroid (coming soon)*

###License

MIT
