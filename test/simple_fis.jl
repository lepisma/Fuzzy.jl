ipa = Dict()
ipb = Dict()
ops = Dict()

ipa["small"] = TriangularMF(1, 2, 3)
ipb["small"] = TriangularMF(1, 2, 3)

ops["small"] = TriangularMF(1, 2, 3)
ips = [ipa, ipb]

ival = [1.2, 2.3]

rule = Rule(["small", "small"], "small")
rules = [rule]

fis = FISMamdani(ips, ops, rules)

@assert eval_FIS(fis, ival) == 2.0