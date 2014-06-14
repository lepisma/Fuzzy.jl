center = 5
sigma = 2

mf = Fuzzy.GaussianMF(center, sigma)

@assert mf.eval(center + sigma) == e ^ (-0.5)
@assert mf.eval(center) == 1
@assert mf.eval(center + sigma) == mf.eval(center - sigma)