# Contains evaluation functions
# ----------------------------------

function eval_FIS(fis, input_values; firing_method = "MIN", defuzz_method = "MOM")
	# Evaluates the FIS
	#
	# Parameters
	# ----------
	# `fis` is the inference system to evaluate
	# `input_values` is an Array of inputs
	# `firing_method` is the method for finding firing strength
	#									Currently supports "MIN" (minimum) and "PROD" (product)
	# `defuzz_method` is the method for defuzzification, see defuzz function definition

	firing_strengths = Float32[]
	
	for rule in fis.rules
		
		tmp_strengths = Float32[]
		
		for i in length(rule.input_mf_names)
			
			push!(tmp_strengths, fis.input_mfs[i][rule.input_mf_names[i]].eval(input_values[i]))
		
		end
		
		if firing_method == "MIN"
			
			push!(firing_strengths, minimum(tmp_strengths))
		
		elseif firing_method == "PROD"
			
			push!(firing_strengths, prod(tmp_strengths))
		
		end
	
	end
	
	defuzz(firing_strengths, collect(values(fis.output_mfs)), defuzz_method = defuzz_method)

end

function defuzz(firing_strengths, output_mfs; defuzz_method = "MOM")
	# Defuzzifies the output using the given firing strengths
	#
	# Parameters
	# ----------
	# `firing_strengths` is an Array of firing strengths
	#											one for each output membership function
	# `output_mfs` is an Array of output membership functions
	# `defuzz_method` is the method for defuzzification
	#									Currently supports "MOM" (Mean of Maximum)
	
	if defuzz_method == "MOM"
		
		max_firing_index = indmax(firing_strengths)
		output_mfs[max_firing_index].mean_at(maximum(firing_strengths))
		
	end

end