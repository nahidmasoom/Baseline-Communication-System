function [d_hat] = filter_rx(s_hat, dsf_filter, switch_graph)

t = linspace(-3.2, 3.2, 25);
rx_filter = sinc(t);    % Lowpass filter

filtered_output = conv(s_hat, rx_filter);

d_hat_filtered = filtered_output(length(rx_filter) : dsf_filter : end - length(rx_filter) - 1);

d_hat = d_hat_filtered / sqrt(mean(abs(d_hat_filtered).^2)); % Signal power is normalized to 1

if switch_graph == 1
    
    eyediagram(d_hat, 2)
    
    figure('Name', 'Rx Filter')
    subplot(2,1,1)
    plot(real(d_hat),'g')
    grid on
    title('Output of Rx Filter')
    xlabel('Time')
    ylabel('Amplitude')
    legend ('Real')
    subplot(2,1,2)
    plot(imag(d_hat),'r')
    grid on
    xlabel('Time')
    ylabel('Amplitude')
    legend ('Imaginary')
    
end

end