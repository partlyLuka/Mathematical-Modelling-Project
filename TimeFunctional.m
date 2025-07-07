function T = TimeFunctional(T1, T2)
%T je function handle
%T je funkcija iz poročila, vzame a in izračuna čas potovanja kroglice po
%grafu med točkama T1 in T2

x1 = T1(1);
y1 = T1(2);

x2 = T2(1);
y2 = T2(2);

x0 = (1/2) * (x2 - x1);
y0 = (1/2) * (y1 - y2);

T = @(a) aux(a, x0, y0);

end

function time = aux(a, x0, y0)
[p_a, p_a_odvod] = p_a_polinom(a, x0, y0);

TZ = [-x0, y0];
TK = [x0, -y0];
v0 = 0;
g0 = 9.81;

[time, vk] = cas_z_zacetno(TZ, TK, v0, p_a, p_a_odvod, g0);

end