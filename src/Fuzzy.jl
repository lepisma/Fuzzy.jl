module Fuzzy
	
	export TriangularMF,
					GaussianMF,
					BellMF,
					TrapezoidalMF,
					
					Rule,
					FISMamdani,
					
					eval_FIS,
					defuzz
	
	# Membership functions
	include("MF.jl")
	
	# FIS
	include("FIS.jl")
	
	# Evaluation functions
	include("Eval.jl")

end # module Fuzzy