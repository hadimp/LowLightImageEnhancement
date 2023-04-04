function T_numerator = T_num(Initial_map, G, Z, Mu)

    delX = multiplydtrans(G - Z / Mu);
    T_numerator = fftshift(fft2(2*Initial_map + Mu*delX));
    
end
