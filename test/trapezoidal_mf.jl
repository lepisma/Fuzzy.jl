import Fuzzy

l_bottom_vertex = 2
l_top_vertex = 5
r_top_vertex = 7
r_bottom_vertex = 11

mf = Fuzzy.MF.TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)

@assert Fuzzy.MF.eval_mf(mf, l_top_vertex) == Fuzzy.MF.eval_mf(mf, r_top_vertex) == 1
@assert Fuzzy.MF.eval_mf(mf, l_bottom_vertex) == Fuzzy.MF.eval_mf(mf, r_bottom_vertex) == 0
@assert Fuzzy.MF.eval_mf(mf, (l_bottom_vertex + l_top_vertex) / 2) == Fuzzy.MF.eval_mf(mf, (r_top_vertex + r_bottom_vertex) / 2) == 0.5