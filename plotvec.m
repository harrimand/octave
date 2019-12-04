function [l, s] = plotvec(cplx)
    x = real(cplx);
    y = imag(cplx);
    xpr = [0, x];
    ypr = [0, y];
    l = line(xpr, ypr, 'color', 'r', 'linewidth', 3);
    hold on
    s = stem(x, y, 'b:', 'linewidth', 3);
    zmag = abs(cplx);
    zang = angle(cplx) * 180/pi;
    T = text(x, y, {sprintf(' %.2f \\angle %.2f^{\\circ}', zmag, zang)},...
     'fontsize', 20);
end
