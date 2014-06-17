# Contains evaluation functions
# ----------------------------------

function eval_FIS(fis::FISMamdani,
					input_values::Vector{Float64};
					firing_method = "MIN",
					defuzz_method = "MOM")
	# Evaluates the FIS
	#
	# Parameters
	# ----------
	# `fis` is the inference system to evaluate
	# `input_values` is a Vector of inputs
	# `firing_method` is the method for finding firing strength
	# 		Currently supports "MIN" (minimum) and "PROD" (product)
	# `defuzz_method` is the method for defuzzification, see defuzz function definition

	firing_strengths = Float64[]
	
	for rule in fis.rules
		
		tmp_strengths = Float64[]
		
		for i in length(rule.input_mf_names)
			
			push!(tmp_strengths, fis.input_mfs_dicts[i][rule.input_mf_names[i]].eval(input_values[i]))
		
		end
		
		if firing_method == "MIN"
			
			push!(firing_strengths, minimum(tmp_strengths))
		
		elseif firing_method == "PROD"
			
			push!(firing_strengths, prod(tmp_strengths))
		
		end
	
	end
	
	defuzz(firing_strengths, fis.rules, fis.output_mfs_dict, defuzz_method = defuzz_method)

end

function defuzz(firing_strengths::Vector{Float64},
				rules::Vector{Rule},
				output_mfs_dict::Dict{Any, Any};
				defuzz_method = "MOM")
	# Defuzzifies the output using the given firing strengths
	#
	# Parameters
	# ----------
	# `firing_strengths` is a Vector of firing strengths
	# 		one for each output membership function
	# `rules` is a Vector of Rule
	# `output_mfs_dict` is a Dict of output membership functions
	# `defuzz_method` is the method for defuzzification
	# 		Currently supports "MOM" (Mean of Maximum)
	
	if defuzz_method == "MOM"
		
		max_firing_index = indmax(firing_strengths)
		max_fired_mf_name = rules[max_firing_index].output_mf_name
		output_mfs_dict[max_fired_mf_name].mean_at(maximum(firing_strengths))
		
	end

end