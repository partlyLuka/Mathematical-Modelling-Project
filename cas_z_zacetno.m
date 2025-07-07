function [cas, vk] = cas_z_zacetno(TZ, TK, v0, f, f_odvod, g0)
%T2 začetna točka
%TK koncčna točka
%v0 začetna hitrost
% f je graf krivulje, ki gre skozi TZ in TK, po kateri se gibljemo.
% f in f_odvod sta function handles

    F = @(x) sqrt(1 + (f_odvod(x)).^2) ./ sqrt(v0^2 - 2*g0.*(f(x) - TZ(2)));
    
    cas = integral(F,TZ(1), TK(1));
    
    vk = sqrt(v0^2 - 2*g0.*(TK(2)-TZ(2)));

end