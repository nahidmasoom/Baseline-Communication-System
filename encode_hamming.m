function [c] = encode_hamming(b, parity_check_matrix, switch_cc_off)

generator_matrix = [eye(4), transpose(parity_check_matrix(: , 1 : 4))]; % Generator matrix derived from parity check matrix

if switch_cc_off == 0
    
    b_reshaped = reshape(b, 4, length(b) / 4);
    codewords = mod(b_reshaped' * generator_matrix, 2); % Codewords are clalculated by modulo 2
    c = reshape(codewords', length(b) * 7 / 4, 1);
    
else
    
    c = b;
    
end

end