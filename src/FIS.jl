#	Contains FIS and Rule types
# ---------------------------

type Rule
	# A Rule connecting input and output membership function
	#	
	# Properties
	# ----------
	# `input_mf_names` is an Array of ASCIIString (one for each input) which contains name of membership functions
	# `output_mf_name` is an ASCIIString containing the connected output membership function name with `input_mf_names`
	
	input_mf_names::Array{ASCIIString, 1}
	output_mf_name::ASCIIString

end

type FISMamdani
	# Fuzzy Inference System of Mamdani type
	#	
	# Properties
	# ----------
	# `input_mfs` is an Array of Dict (one for each input) which contains membership function
	#							associated with its name
	#							as "small" => TriangularMF(1, 2, 3)
	# `output_mfs` is a Dict containing membership function of output associated with names
	#							as "small" => GaussianMF(4, 2)
	#
	#	`eval_FIS` function finds the output given inputs and rules
	
	input_mfs::Array{Dict{Any, Any}, 1}
	output_mfs::Dict{Any, Any}
	rules::Array{Rule, 1}

end