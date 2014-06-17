# Fuzzy

![Travis-CI Build Status](https://travis-ci.org/lepisma/Fuzzy.jl.svg)

Fuzzy Inference System in julia

###Install

`Pkg.clone("git://github.com/lepisma/Fuzzy.jl.git")`

###QuickStart

`using Fuzzy`

-	Create input, output membership functions and rules

```
input_a = {"small" => Fuzzy.TriangularMF(1, 2, 3), "large" => Fuzzy.TriangularMF(4, 5, 6)}
input_b = {"small" => Fuzzy.TriangularMF(1, 2, 3)}

inputs = [input_a, input_b]
output = {"small" => TriangularMF(1, 2, 3)}

rule = Rule(["large", "small"], "small")
rules = [rule]
```
    
-	Create FIS

```
fis = FISMamdani(inputs, output, rules)
```

-	Find output

```
in_vals = [4.7, 2.3]
eval_FIS(fis, in_vals)
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
    -	*Sigmoid (coming soon)*
    -	*L-R*
-	Defuzzification
	-	**Mean of Maximum**
    -	*Weighted Average (coming soon)*
    -	*Centroid (coming soon)*

###License

MIT