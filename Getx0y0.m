function [x0, y0] = Getx0y0(T1, T2)
%Iz točk T1 in T2 poračunamo pozitivni konstanti x0 in y0 iz poročila

x0 = 0.5 * (T2(1) - T1(1));
y0 = 0.5 * (T1(2) - T2(2));


end