function [p_a, p_a_odvod] = p_a_polinom(a, x0, y0)
%vrne polinoma p_a in p_a' kot function handla

p_a = @(x) a .* x.^3 - (y0/x0 + a .* x0^2) .* x;  
p_a_odvod = @(x) 3 * a .* x.^2 - y0/x0 - a .* x0^2;  

end