import Fuzzy

l_bottom_vertex = 2
l_top_vertex = 5
r_top_vertex = 7
r_bottom_vertex = 11

mf = Fuzzy.MF.TrapezoidalMF(l_bottom_vertex, l_top_vertex, r_top_vertex, r_bottom_vertex)

@assert mf.eval(l_top_vertex) == mf.eval(r_top_vertex) == 1
@assert mf.eval(l_bottom_vertex) == mf.eval(r_bottom_vertex) == 0
@assert mf.eval((l_bottom_vertex + l_top_vertex) / 2) == mf.eval((r_top_vertex + r_bottom_vertex) / 2) == 0.5