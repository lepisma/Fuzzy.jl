a = 1
c = -5
limit = 10

mf = SigmoidMF(a, c, limit)

@assert mf.eval(c) == 0.5
@assert mf.eval(c - 5) < mf.eval(c + 5)