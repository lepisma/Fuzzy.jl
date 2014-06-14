type FISMamdani

	input_mfs::Array{Dict{Any, Any}, 1}
	output_mfs::Dict{Any, Any}
	
	evalFIS::Function
	
	function FISMamdani(input_mfs, output_mfs)
	
		function evalFIS(input_values, rules; firing_method = "MIN", defuzz_method = "COM")
		
			firing_strengths = Float32[]
			for rule in rules
				firing_strength = Float32[]
				
				for i in length(rule.input_mf_names)
					push!(firing_strength, input_mfs[i][rule.input_mf_names[i]].eval(input_values[i]))
				end
				
				if firing_method == "MIN"
					push!(firing_strengths, minimum(firing_strength))
				elseif firing_method == "PROD"
					push!(firing_strengths, prod(firing_strength))
				end
			end
			
			return defuzz(firing_strengths, values(output_mfs), defuzz_method = defuzz_method)
		end
		
		new(input_mfs, output_mfs, evalFIS)
	end

end

function defuzz(firing_strengths, output_mfs; defuzz_method = "COM")
	####
	return 42
end

type Rule

	input_mf_names::Array{ASCIIString, 1}
	output_mf_name::ASCIIString

end