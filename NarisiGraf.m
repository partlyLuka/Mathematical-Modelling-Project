function NarisiGraf(T1, T2)
%T1, T2 točki v ravnini
%Funkcija poišče polinom tretje stopnje, ki interpolira T1, T2 in 0.5 * (T1
%+ T2), da bo čas potovanja kroglice po njenem grafu najkrajši. Nato nariše
%ta polinom in na grafu označi relevantne točke. Poleg tega še izriše graf,
%ki prikazuje, kako se čas potovanja, če spreminjamo parameter, ki v celoti
%določa polinom, ki zgolj interpolira relevantne točke. 

x1 = T1(1);
y1 = T1(2);

x2 = T2(1);
y2 = T2(2);

xp = 0.5 * (T1(1) + T2(1));
yp = 0.5 * (T1(2) + T2(2));

[x0, y0] = Getx0y0(T1, T2);

k = y0/ (x0)^3;
bound1 = -4*k;
bound2 = 0.5 * k;

T = TimeFunctional(T1, T2);

[amin, Tmin] = fminbnd(T, bound1, bound2);


eps = 0.0001;
a_range = linspace(bound1 + eps, bound2 - eps);


a = amin;
[p_a, p_a_odvod] = p_a_polinom(a, x0, y0);
x_novi = linspace(x1 - 1, x2 + 1);
novi_p_a = @(s) p_a(s - xp) + yp;

figure;

subplot(1,2,1);
hold on;


plot(x_novi, novi_p_a(x_novi))
plot(T1(1), T1(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
plot(T2(1), T2(2), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
plot(0.5 * (T1(1) + T2(1)), 0.5 * (T1(2) + T2(2)), 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
text(xp, yp + 0.3, 'S', 'FontSize', 12, 'Color', 'k')
text(x1, y1 + 0.3, 'T1', 'FontSize', 12, 'Color', 'k')
text(x2, y2 + 0.3, 'T2', 'FontSize', 12, 'Color', 'k')

grid on
xlabel('x')
ylabel('y')

title(sprintf('Graf polinom z vhodnimi podatki T1 = (%.2f, %.2f) in T2 = (%.2f, %.2f)', T1(1), T1(2), T2(1), T2(2)))

hold off;




subplot(1,2,2);
hold on;


plot(a_range, arrayfun(T, a_range))
plot(amin, Tmin, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r')
text(amin, Tmin + 0.3, 'Minimum', 'FontSize', 12, 'Color', 'k')

title('Graf funkcije T')

grid on;
grid on
xlabel('a')
ylabel('T(a)')


ylim_current = ylim;
xlim_current = xlim;
x_center = mean(xlim_current);
y_text = ylim_current(1) - 0.1 * (ylim_current(2) - ylim_current(1));


text(x_center, y_text, ...
    sprintf('Minimalna vrednost: a = %.4f, T = %.4f', amin, Tmin), ...
    'HorizontalAlignment', 'center', 'FontSize', 11)


hold off;
print(gcf, 'NarisiGraf.png', '-dpng', '-r300')

filename = sprintf('NarisiGraf_x1_%.2f_y1_%.2f_x2_%.2f_y2_%.2f.png', x1, y1, x2, y2);
filename = strrep(filename, '.', '_');
%print(gcf, filename, '-dpng', '-r300')
print(gcf, 'Zadnja', '-dpng', '-r300')

end