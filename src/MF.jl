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

type BellMF
	# Generalised Bell membership function
	
	a
	b
	c
end

type TrapezoidalMF
	# Trapezoidal membership function
	
	l_bottom_vertex
	l_top_vertex
	r_top_vertex
	r_bottom_vertex
	
	function TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)
		if l_bottom_vertex <= l_top_vertex <= r_top_vertex <= r_bottom_vertex
			new(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)
		else
			error("invalid vertices")
		end
	end
end

##########################################

function eval_mf(mf, x)
	# Evaluates the value of mf at x
	
	if typeof(mf) == TriangularMF
		return max(min(((x - mf.l_vertex) / (mf.center - mf.l_vertex)), ((mf.r_vertex - x) / (mf.r_vertex - mf.center))), 0)
	
	elseif typeof(mf) == GaussianMF
		return e ^ ( - 0.5 * ((x - mf.center) / mf.sigma) ^ 2)
		
	elseif typeof(mf) == BellMF
		return  1 / (1 + ((x - mf.c) / mf.a) ^ (2 * mf.b))
	
	elseif typeof(mf) == TrapezoidalMF
		return max(min(((x - mf.l_bottom_vertex) / (mf.l_top_vertex - mf.l_bottom_vertex)), 1, ((mf.r_bottom_vertex - x) / (mf.r_bottom_vertex - mf.r_top_vertex))), 0)
	end
	
end

end