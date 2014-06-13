import Fuzzy

a = 2
b = 3
c = 5

mf = Fuzzy.MF.BellMF(a, b, c)

@assert Fuzzy.MF.eval_mf(mf, c) == 1
@assert Fuzzy.MF.eval_mf(mf, c - a) == Fuzzy.MF.eval_mf(mf, c + a) == 0.5