import Fuzzy

l_vertex = 2
center = 5
r_vertex = 7

mf = Fuzzy.MF.TriangularMF(l_vertex, center, r_vertex)

@assert Fuzzy.MF.eval_mf(mf, center) == 1
@assert Fuzzy.MF.eval_mf(mf, l_vertex) == Fuzzy.MF.eval_mf(mf, r_vertex) == 0
@assert Fuzzy.MF.eval_mf(mf, (l_vertex + center) / 2) == Fuzzy.MF.eval_mf(mf, (r_vertex + center) / 2) == 0.5