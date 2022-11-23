function [s_hat] = clip_rx(y, rxthresh, switch_graph)

r = abs(y);
theta = angle(y);

clipping_mask = r > rxthresh;   % Compared with clipping threshold
r(clipping_mask) = rxthresh;

[a, b] = pol2cart(theta, r);
s_hat = a + b * 1i; % Polar to cartesian transformation

if switch_graph == 1
    
    figure('name','Rx Hardware')
    subplot(2,1,1)
    plot(abs(y))
    title('Input Signal of Rx Hardware')
    xlabel('Time')
    ylabel('Magnitude')
    grid on
    subplot(2,1,2)
    plot(abs(s_hat))
    grid on
    title('Output Signal of Rx Hardware')
    xlabel('Time')
    ylabel('Magnitude')
    
end

end