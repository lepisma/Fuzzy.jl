#
# Tests
#

using Fuzzy

tests = ["triangular_mf.jl",
				"gaussian_mf.jl",
				"trapezoidal_mf.jl",
				"bell_mf.jl"]
				
println("Running test:")

for tst in tests
	println(" * $(tst)")
	include(tst)
end