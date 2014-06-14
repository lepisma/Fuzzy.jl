ipa = Dict()
ipb = Dict()
ops = Dict()

ipa["small"] = Fuzzy.TriangularMF(1, 2, 3)
ipb["small"] = Fuzzy.TriangularMF(1, 2, 3)

ops["small"] = Fuzzy.TriangularMF(1, 2, 3)
ips = [ipa, ipb]

ival = [1.2, 2.3]

rule = Fuzzy.Rule(["small", "small"], "small")
rules = [rule]

fis = Fuzzy.FISMamdani(ips, ops)

@assert fis.eval_FIS(ival, rules) == 2.0