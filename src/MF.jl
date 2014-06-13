module MF

##########################################
# Module defining the membership functions
##########################################

export TriangularMF, eval_triangular_mf
export GaussianMF, eval_gaussian_mf

type TriangularMF
	# Triangular membership function
	
	left_vertex
	center
	right_vertex
end

function eval_triangular_mf(x, mf::TriangularMF)
	# Evaluates the value of mf at x
	
	if (x < mf.left_vertex) || (x > mf.right_vertex)
		return 0
	elseif (x <= mf.center)
		return (x - mf.left_vertex) / (mf.center - mf.left_vertex)
	elseif (x > mf.center)
		return (mf.right_vertex - x) / (mf.right_vertex - mf.center)
	end
end

#########################################

type GaussianMF
	# Gaussian membership function
	
	center
	sigma
end

function eval_gaussian_mf(x, mf::GaussianMF)
	# Evaluates the value of mf at x
	
	return e ^ ( - 0.5 * ((x - mf.center) / mf.sigma) ^ 2)
end

end