module MF

##########################################
# Module defining the membership functions
##########################################

export TriangularMF, GaussianMF
export eval_mf

##########################################

type TriangularMF
	# Triangular membership function type
	
	l_vertex
	center
	r_vertex
	
	function TriangularMF(l_vertex, center, r_vertex)
		if l_vertex <= center <= r_vertex
			new(l_vertex, center, r_vertex)
		else
			error("invalid vertices")
		end
	end
	
end

type GaussianMF
	# Gaussian membership function
	
	center
	sigma
end

##########################################

function eval_mf(mf, x)
	# Evaluates the value of mf at x
	
	if typeof(mf) == TriangularMF
		
		return max(min(((x - mf.l_vertex) / (mf.center - mf.l_vertex)), ((mf.r_vertex - x) / (mf.r_vertex - mf.center))), 0)
	
	elseif typeof(mf) == GaussianMF
		return e ^ ( - 0.5 * ((x - mf.center) / mf.sigma) ^ 2)
	end
	
end

end