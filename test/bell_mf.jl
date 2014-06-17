a = 2
b = 3
c = 5

mf = BellMF(a, b, c)

@assert mf.eval(c) == 1
@assert mf.eval(c - a) == mf.eval(c + a) == 0.5