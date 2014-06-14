module MF

#-----------------------------------------
# Module defining the membership functions
#-----------------------------------------

export TriangularMF, GaussianMF, BellMF, TrapezoidalMF

#-----------------------------------------

type TriangularMF
	# Triangular membership function type
	
	l_vertex
	center
	r_vertex

	eval::Function
	mean_at::Function

	function TriangularMF(l_vertex, center, r_vertex)
		if l_vertex <= center <= r_vertex
		
			function eval(x)
				maximum([minimum([((x - l_vertex) / (center - l_vertex)), ((r_vertex - x) / (r_vertex - center))]), 0])
			end
			
			function mean_at(firing_strength)
				p1 = (center - l_vertex) * firing_strength + l_vertex
				p2 = (center - r_vertex) * firing_strength + r_vertex
				(p1 + p2) / 2
			end
			
			new(l_vertex, center, r_vertex, eval, mean_at)
		else
			error("invalid vertices")
		end
	end
	
end

#-----------------------------------------

type GaussianMF
	# Gaussian membership function
	
	center
	sigma
	
	eval::Function
	mean_at::Function
	
	function GaussianMF(center, sigma)
	
		function eval(x)
			e ^ ( - 0.5 * ((x - center) / sigma) ^ 2)
		end
		
		function mean_at(firing_strength)
			p1 = center + sigma * sqrt(-2 * log(firing_strength))
			p2 = 2 * center - p1
			(p1 + p2) / 2
		end
		
		new(center, sigma, eval, mean_at)
	end
end

#-----------------------------------------

type BellMF
	# Generalised Bell membership function
	
	a
	b
	c
	
	eval::Function
	mean_at::Function
	
	function BellMF(a, b, c)
	
		function eval(x)
			1 / (1 + abs((x - c) / a) ^ (2 * b))
		end
		
		function mean_at(firing_strength)
			p1 = center + a * (((1 / firing_strength) - 1) ^ (-2 * b))
			p2 = 2 * center - p1
			(p1 + p2) / 2
		end
		
		new(a, b, c, eval, mean_at)
	end
end

#-----------------------------------------

type TrapezoidalMF
	# Trapezoidal membership function
	
	l_bottom_vertex
	l_top_vertex
	r_top_vertex
	r_bottom_vertex
	
	eval::Function
	mean_at::Function
	
	function TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)
		if l_bottom_vertex <= l_top_vertex <= r_top_vertex <= r_bottom_vertex
		
			function eval(x)
				maximum([minimum([((x - l_bottom_vertex) / (l_top_vertex - l_bottom_vertex)), 1, ((r_bottom_vertex - x) / (r_bottom_vertex - r_top_vertex))]), 0])
			end
			
			function mean_at(firing_strength)
				p1 = (l_top_vertex - l_bottom_vertex) * firing_strength + l_bottom_vertex
				p2 = (r_top_vertex - r_bottom_vertex) * firing_strength + r_bottom_vertex
				(p1 + p2) / 2
			end
			
			new(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex, eval, mean_at)
		else
			error("invalid vertices")
		end
	end
end

end