function [Rt] = rcRvsT(V, Vc, C, t)
    % Vc = 3.5;
    % C = 100E-6;
    % t = .1:.1:3.1;
    % V = 5;

% Derive R from capacitor charge equation
    % Vc = V * (1 - exp(-t / (R * C)));
    % Vc/V = 1 - exp(-t / (R * C));
    % Vc/V - 1 = -exp(-t / (R * C));
    % -Vc/V + 1 = exp(-t / (R * C));
    % log(-Vc/V + 1) = -t / (R * C);
    % log(-Vc/V + 1) / -t = -t / (R * C * -t);
    % log(-Vc/V + 1) / -t = 1 / (R * C);
    % -t / log(-Vc/V + 1) = R * C;
    % -t / (C * log(-Vc/V + 1)) = R;
    % R = -t / (C * log(-Vc/V + 1));
    % Rdt = @(Vc, V, C t) -t / (C * log(-Vc/V + 1));
    Rdt = @(Vc, V, C, t) -t / (C * log(-Vc/V + 1));


    Rt = Rdt(Vc, V, C, t);
    plot(t, Rt, 'linewidth', 2, 'color', 'b')
    grid on
    set (gca, 'fontsize', 20)
    xlabel('Time', 'fontsize', 20)
    ylabel('Resistor Value', 'fontsize', 20)

    VLabel = sprintf("V = %s", num2str(V));
    VcLabel = sprintf("Vc = %s", num2str(Vc));
    CLabel = sprintf("C = %s uF", num2str(C * 1E6));
    Tx = text(.1, .75, {VLabel, VcLabel, CLabel},...
        'units', 'normalized', 'fontsize', 20, 'fontweight', 'bold');
    title("Series R-C  Time vs. Resistor Value",...
        'fontsize', 20, 'fontweight', 'bold')

    printf("Rt = rcRvsT(V, Vc, C, t)\n")
    printf("Rt = rcRvsT(5, 3.5, 100E-6, 0:.1:3.1)\n")
    printf("Find R for target time:\n")
    printf("targetTime = 2.5\n")
    printf("Rt(find(t == max(t(t<=targetTime))))\n")    
end
