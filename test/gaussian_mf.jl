import Fuzzy

center = 5
sigma = 2

mf = Fuzzy.MF.GaussianMF(center, sigma)

@assert Fuzzy.MF.eval_mf(mf, center + sigma) == e ^ (-0.5)
@assert Fuzzy.MF.eval_mf(mf, center) == 1
@assert Fuzzy.MF.eval_mf(mf, center + sigma) == Fuzzy.MF.eval_mf(mf, center - sigma)