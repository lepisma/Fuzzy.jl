ipa = Dict()
ipb = Dict()
ops = Dict()

# Input membership functions
ipa["small"] = TriangularMF(1, 2, 3)
ipb["small"] = TriangularMF(1, 2, 3)
ips = [ipa, ipb]

# Output membership functions
ops["small"] = TriangularMF(1, 2, 3)

# Input values
ival = [1.2, 2.3]

# Simple rule
rule = Rule(["small", "small"], "small")
rules = [rule]

fis = FISMamdani(ips, ops, rules)

@assert eval_fis(fis, ival) == 2.0