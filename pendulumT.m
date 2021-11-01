
function [theta] = pendulumT()
    fs = 34; % Font Size for axis, title, legend
    l = 1;
    g = 9.81;
    m = 1;
    b = 0.05;
    t = linspace(0, 20, 400);
    % theta0 = [0, 3];
    theta0 = [pi/4, 0];
    [t, theta] = ode45(@(t, theta) [theta(2); -(b * theta(2)/m)-(g*sin(theta(1))/l)], t, theta0);
    figure(1);
    plot(t, theta(:,1), 'color', 'b', 'linewidth', 3);
    hold on;
    plot(t, theta(:,2), 'color', 'r', 'linewidth', 3);
    grid on;
    set(gca, 'gridalpha', .8);
    Leg = legend('Angular displacement', 'Angular velocity');
    xticks([0:20]); 
    set(Leg, 'fontsize', fs);
    xlabel('Time (Seconds)', 'fontsize', fs);
    ylabel('Magnitude', 'fontsize', fs);
    title('Pendulum plot for angular displacement and angular velocity' , 'fontsize', fs);
    set(gca, 'fontsize', fs);
    
    
    
    for i = 1:length(theta(1))
        figure(2)
        clf;
        x0 = 0;
        y0 = 0;
        x1 = l * sin(theta(i, 1));
        y1 = l * cos(theta(i, 1));
        plot([-1, 1], [0, 0], 'linewidth', 3);
        hold on;
        line([x0, x1], [-y0, -y1], 'linewidth', 3);
        plot(x1, -y1, "0", 'markersize', 40, 'markerfacecolor', 'g');
        grid on;
        axis([-1.5, 1.5, -1.5, 0.5]);
        title('Pendulum animation', 'fontsize', 20);
        printf('Creating GIF- Progrss... %d/%dn', i, length(t));
        img = print('-RGBImage');
        imwrite(img, 'animation.gif', 'DelayTime', 0.1, 'Compression', 'bzip', 'WriteMode', 'append');
                
    endfor
% https://skill-lync.com/student-projects/week-3-speed-programming-in-matlab-octave-for-non-computer-science-engineers-24
 
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
   
    
    
endfunction
