#	Contains FIS and Rule types
# ---------------------------

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
	
	eval_FIS::Function
	
	function FISMamdani(input_mfs, output_mfs)
	
		this = new()
		
		this.input_mfs = input_mfs
		this.output_mfs = output_mfs
		
		this.eval_FIS = function eval_FIS(input_values, rules; firing_method = "MIN", defuzz_method = "MOM")
			# Evaluates the FIS
			#
			# Parameters
			# ----------
			# `input_values` is an Array of inputs
			# `rules` is an Array of Rules
			# `firing_method` is the method for finding firing strength
			#									Currently supports "MIN" (minimum) and "PROD" (product)
			# `defuzz_method` is the method for defuzzification, see defuzz function definition
		
			firing_strengths = Float32[]
			
			for rule in rules
				
				tmp_strengths = Float32[]
				
				for i in length(rule.input_mf_names)
					
					push!(tmp_strengths, this.input_mfs[i][rule.input_mf_names[i]].eval(input_values[i]))
				
				end
				
				if firing_method == "MIN"
					
					push!(firing_strengths, minimum(tmp_strengths))
				
				elseif firing_method == "PROD"
					
					push!(firing_strengths, prod(tmp_strengths))
				
				end
			
			end
			
			defuzz(firing_strengths, collect(values(this.output_mfs)), defuzz_method = defuzz_method)
		
		end
		
		this
		
	end

end

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