function [s] = filter_tx(d, usf_filter, switch_graph)

d_upsampled = zeros(length(d) * usf_filter, 1);
d_upsampled(1: usf_filter : end) = d;    % Upsampling by usf_filter factor

t = linspace(-3.2, 3.2, 25);
tx_filter = sinc(t);

s_filtered = conv(d_upsampled, tx_filter);

s = s_filtered / sqrt(mean(abs(s_filtered).^2));    % Signal power is normalized to 1

if switch_graph == 1
   
    %fvtool(tx_filter, "impulse")
    figure('Name', 'Transmitter Filter Output')
    subplot(2,1,1)
    plot(real(s),'g')
    grid on
    title('Tx Filter Output')
    xlabel('Time')
    ylabel('Amplitude')
    legend ('Real')
    subplot(2,1,2)
    plot(imag(s),'r')
    grid on
    xlabel('Time')
    ylabel('Amplitude')
    legend ('Imaginary')
    
end

end