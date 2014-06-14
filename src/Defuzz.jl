# Contains defuzzification functions
# ----------------------------------

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