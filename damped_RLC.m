# damped_RLC
warning('off', 'Octave:possible-matlab-short-circuit-operator');

close

L = 56E-3
C = 2E-6
R = 15
V0 = 5;
%------------------------------------------------------------------------------
function [zind] = zeroCross(M, pn)
% zeroCross(M, pn)
%     M = vector with values crossing zero
%     pn > 0: return indexes where M(ind) < 0 and M(index+1) > 0;
%     pn < 0: return indexes where M(ind) > 0 and M(index+1) < 0;
%     pn == 0: return indexes where M(ind) < 0 and M(index+1) > 0 and
%              indexes where M(ind) > 0 and M(index+1) < 0;

    if nargin < 2
        pn = 0;
    end
    % disp(pn)
    zind = [];
    n = numel(M);
    for t = 1:n - 1
        if (pn == 0) && (((M(t)<0) && (M(t+1)>0)) | ((M(t)>0) && (M(t+1)<0)))
            zind = [zind, t];
        elseif (pn > 0) && (M(t) < 0) && (M(t+1) > 0)
            zind = [zind, t];
        elseif (pn < 0) && (M(t) > 0) && (M(t+1) < 0)
            zind = [zind, t];
        end
    end
end
%------------------------------------------------------------------------------
w = sqrt(1/(L*C)-R^2/(4 * L^2))
f = w / (2 * pi)
y = R / (2 * L)
T = 1 / f
t = 0:T / 20:20*T;
qc = @(t, V0, R, L, C, y) V0 .* exp(-y.*t) .* cos(sqrt(1/(L*C)-R^2/(4*L^2)).*t);
qs = @(t, V0, R, L, C, y) V0 .* exp(-y.*t) .* sin(sqrt(1/(L*C)-R^2/(4*L^2)).*t);
q_env = @(t, V0, y) V0 .* exp(-y.*t);

vc = qc(t, V0, R, L, C, y);
vs = qs(t, V0, R, L, C, y);
v_env = q_env(t, V0, y);

figure();
axis();

pc = plot(t, vc, 'y', 'linewidth', 2); % dampened oscillations
hold on
ps = plot(t, vs, 'g', 'linewidth', 2); % dampened oscillations
ph = plot(t, v_env, 'm', 'linewidth', 1); % Positive envelope
phn = plot(t, -v_env, 'm', 'linewidth', 1); % Negative envelope

Zc = zeroCross(vc, -1) % Find indexes where cosin plot crosses zero.
Zs = zeroCross(vs, -1) % Find indexes where sin plot crosses zero.

%------------------------------------------------------------------------------
% set(gcf, 'Position', [145, 522, 1698, 954]);
pause(.5)
set(gcf, 'Position', [32, 250, 1700, 960]); % set figure size

titleStr = sprintf("RLC Dampening,   F = %d", f)

title(titleStr, 'fontsize', 30, 'fontweight', 'bold', 'color', 'y');
set(gca, 'fontsize', 20);
set(gca, 'XLim', [0, 20*T], 'YLim', [-V0, V0]);
set(gca, 'XTick', 0.00:2 * T:20*T);
set(gca, 'YTick', -V0:V0/10:V0);
set(gca, 'color', 'k');
set(gcf, 'color', 'k');
set(gca, 'XColor', [.9, .9, .9])
set(gca, 'YColor', [.9, .9, .9])
grid on;
