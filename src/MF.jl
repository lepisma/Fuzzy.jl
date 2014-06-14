module MF

##########################################
# Module defining the membership functions
##########################################

export TriangularMF, GaussianMF, BellMF, TrapezoidalMF

##########################################

type TriangularMF
	# Triangular membership function type
	
	l_vertex
	center
	r_vertex

	eval::Function

	function TriangularMF(l_vertex, center, r_vertex)
		if l_vertex <= center <= r_vertex
		
			function eval(x)
				maximum([minimum([((x - l_vertex) / (center - l_vertex)), ((r_vertex - x) / (r_vertex - center))]), 0])
			end
			
			new(l_vertex, center, r_vertex, eval)
		else
			error("invalid vertices")
		end
	end
	
end

type GaussianMF
	# Gaussian membership function
	
	center
	sigma
	
	eval::Function
	
	function GaussianMF(center, sigma)
	
		function eval(x)
			e ^ ( - 0.5 * ((x - center) / sigma) ^ 2)
		end
		
		new(center, sigma, eval)
	end
end

type BellMF
	# Generalised Bell membership function
	
	a
	b
	c
	
	eval::Function
	
	function BellMF(a, b, c)
	
		function eval(x)
			1 / (1 + ((x - c) / a) ^ (2 * b))
		end
		
		new(a, b, c, eval)
	end
end

type TrapezoidalMF
	# Trapezoidal membership function
	
	l_bottom_vertex
	l_top_vertex
	r_top_vertex
	r_bottom_vertex
	
	eval::Function
	
	function TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)
		if l_bottom_vertex <= l_top_vertex <= r_top_vertex <= r_bottom_vertex
		
			function eval(x)
				maximum([minimum([((x - l_bottom_vertex) / (l_top_vertex - l_bottom_vertex)), 1, ((r_bottom_vertex - x) / (r_bottom_vertex - r_top_vertex))]), 0])
			end
			
			new(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex, eval)
		else
			error("invalid vertices")
		end
	end
end

end