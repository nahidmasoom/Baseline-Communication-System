function [c_hat] = detect_symbols(d_hat, switch_mod, switch_graph)

M = 16; % Modulation order
K = log2(M);    % No. of bits per symbol

if switch_mod == 0
    
    constellation_points = sqrt(1 / 10) * [-3-3i; -3-1i; -3+3i; -3+1i; -1-3i; -1-1i; -1+3i; -1+1i; 3-3i; 3-1i; 3+3i; 3+1i; 1-3i; 1-1i; 1+3i; 1+1i];
    
else
    
    constellation_points = [cosd(0)+1i*sind(0); cosd(22.5)+1i*sind(22.5); cosd(67.5)+1i*sind(67.5); cosd(45)+1i*sind(45);
        cosd(157.5)+1i*sind(157.5); cosd(135)+1i*sind(135); cosd(90)+1i*sind(90); cosd(112.5)+1i*sind(112.5);
        cosd(337.5)+1i*sind(337.5); cosd(315)+1i*sind(315); cosd(270)+1i*sind(270); cosd(292.5)+1i*sind(292.5);
        cosd(180)+1i*sind(180); cosd(202.5)+1i*sind(202.5); cosd(247.5)+1i*sind(247.5); cosd(225)+1i*sind(225)];
    
end

c_hat = zeros(length(d_hat) * K, 1);

for i = 1 : length(d_hat)
    
    distance = abs(d_hat(i) - constellation_points);    % Distances are calculted from symbol to constellation points
    [~, symbol_index] = min(distance);  % Symbol index is found by minimum distance
    j = (i-1)* K + 1;   % Indexing for bit stream c_hat
    c_hat(j : j + K - 1) = de2bi(symbol_index - 1, K, 'left-msb')'; % Decimal to binary conversion
    
end

if switch_graph == 1
    
    D = scatterplot(d_hat, 1, 0, 'g.');
    hold on
    scatterplot(constellation_points, 1, 0, 'b*', D)
    title('Constellation at Receiver')
    grid on
    
end

end