function [d] = map2symbols(c, switch_mod, switch_graph)

M = 16; % Modulation order
K = log2(M);    % No. of bits per symbol

if switch_mod == 0
    
    constellation_points = sqrt(1 / 10) * [-3-3i; -3-1i; -3+3i; -3+1i; -1-3i; -1-1i; -1+3i; -1+1i; 3-3i; 3-1i; 3+3i; 3+1i; 1-3i; 1-1i; 1+3i; 1+1i];
    % Normalized constellation (indexed according to gray mapping) for 16-QAM having average symbol power 1
    
else
    
    constellation_points = [cosd(0)+1i*sind(0); cosd(22.5)+1i*sind(22.5); cosd(67.5)+1i*sind(67.5); cosd(45)+1i*sind(45);
        cosd(157.5)+1i*sind(157.5); cosd(135)+1i*sind(135); cosd(90)+1i*sind(90); cosd(112.5)+1i*sind(112.5);
        cosd(337.5)+1i*sind(337.5); cosd(315)+1i*sind(315);  cosd(270)+1i*sind(270); cosd(292.5)+1i*sind(292.5);
        cosd(180)+1i*sind(180); cosd(202.5)+1i*sind(202.5);  cosd(247.5)+1i*sind(247.5);  cosd(225)+1i*sind(225)];
    % Constellation (indexed according to gray mapping) for 16-PSK
    
end

d = zeros(length(c) / K, 1);

for i = 1 : K : length(c)
    
    symbol_index = bi2de(transpose(c(i : i + K - 1)), 'left-msb');  % Binary to decimal coversion
    d((i-1)/ K + 1) = constellation_points(symbol_index + 1);   % Symbols are mapped into the constelation points
    
end

if switch_graph == 1
    
    scatterplot(d, 1, 0, 'b*')
    title('Modulated Symbols')
    grid on
    
end

end