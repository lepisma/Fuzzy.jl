# Contains various membership function types
# ------------------------------------------

type TriangularMF
	# Triangular membership function type
	#	
	# Properties
	# ----------
	# `l_vertex`, `center` and `r_vertex` are the vertices of the triangle, in order
	#
	#	`eval` function returns membership value at a point
	# `mean_at` function returns mean value at line clipped by given firing strength
	
	l_vertex
	center
	r_vertex

	eval::Function
	mean_at::Function

	function TriangularMF(l_vertex, center, r_vertex)
	
		if l_vertex <= center <= r_vertex
		
			this = new()
			
			this.l_vertex = l_vertex
			this.center = center
			this.r_vertex = r_vertex
			
			this.eval = function eval(x)
			
				maximum([minimum([((x - this.l_vertex) / (this.center - this.l_vertex)), ((this.r_vertex - x) / (this.r_vertex - this.center))]), 0])
				
			end
			
			this.mean_at = function mean_at(firing_strength)
			
				p1 = (this.center - this.l_vertex) * firing_strength + this.l_vertex
				p2 = (this.center - this.r_vertex) * firing_strength + this.r_vertex
				(p1 + p2) / 2
				
			end
			
			this
			
		else
		
			error("invalid vertices")
			
		end
		
	end
	
end

type GaussianMF
	# Gaussian membership function type
	#	
	# Properties
	# ----------
	# `center` is the center of the distribution
	# `sigma` determines width of the distribution
	#
	#	`eval` function returns membership value at a point
	# `mean_at` function returns mean value at line clipped by given firing strength
	
	center
	sigma
	
	eval::Function
	mean_at::Function
	
	function GaussianMF(center, sigma)
	
		this = new()
		
		this.center = center
		this.sigma = sigma
		
		this.eval = function eval(x)
		
			e ^ ( - 0.5 * ((x - this.center) / this.sigma) ^ 2)
			
		end
	
		this.mean_at = function mean_at(firing_strength)
		
			p1 = this.center + this.sigma * sqrt(-2 * log(firing_strength))
			p2 = 2 * this.center - p1
			(p1 + p2) / 2
			
		end
		
		this
		
	end
	
end

type BellMF
	# Generalised Bell membership function type
	#	
	# Properties
	# ----------
	# `a`, `b` and `c` the usual bell parameters with `c` being the center
	#
	#	`eval` function returns membership value at a point
	# `mean_at` function returns mean value at line clipped by given firing strength
	
	a
	b
	c
	
	eval::Function
	mean_at::Function
	
	function BellMF(a, b, c)
		
		this = new()
		
		this.a = a
		this.b = b
		this.c = c
		
		this.eval = function eval(x)
		
			1 / (1 + abs((x - this.c) / this.a) ^ (2 * this.b))
			
		end
		
		this.mean_at = function mean_at(firing_strength)
		
			p1 = this.c + this.a * (((1 / firing_strength) - 1) ^ (-2 * this.b))
			p2 = 2 * this.c - p1
			(p1 + p2) / 2
			
		end
		
		this
		
	end
	
end

type TrapezoidalMF
	# Trapezoidal membership function type
	#	
	# Properties
	# ----------
	# `l_bottom_vertex`, `l_top_vertex`, `r_top_vertex` and `r_bottom_vertex` are the vertices of the trapezoid, in order
	#
	#	`eval` function returns membership value at a point
	# `mean_at` function returns mean value at line clipped by given firing strength
	
	l_bottom_vertex
	l_top_vertex
	r_top_vertex
	r_bottom_vertex
	
	eval::Function
	mean_at::Function
	
	function TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)
	
		if l_bottom_vertex <= l_top_vertex <= r_top_vertex <= r_bottom_vertex
		
			this = new()
			
			this.l_bottom_vertex = l_bottom_vertex
			this.l_top_vertex = l_top_vertex
			this.r_top_vertex = r_top_vertex
			this.r_bottom_vertex = r_bottom_vertex
		
			this.eval = function eval(x)
			
				maximum([minimum([((x - this.l_bottom_vertex) / (this.l_top_vertex - this.l_bottom_vertex)), 1, ((this.r_bottom_vertex - x) / (this.r_bottom_vertex - this.r_top_vertex))]), 0])
				
			end
			
			this.mean_at = function mean_at(firing_strength)
			
				p1 = (this.l_top_vertex - this.l_bottom_vertex) * firing_strength + this.l_bottom_vertex
				p2 = (this.r_top_vertex - this.r_bottom_vertex) * firing_strength + this.r_bottom_vertex
				(p1 + p2) / 2
				
			end
			
			this
			
		else
		
			error("invalid vertices")
			
		end
		
	end
	
end