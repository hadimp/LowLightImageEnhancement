function Refined_map = calc_refined_map(Initial_map, Alpha, Rho, Mu, Num_iter)
    
    [M, N] = size(Initial_map);
    T = zeros(M,N);

    Z = zeros(2*M,N);
    G = Z;
    W = ones(2*M,N); 

    for k = 0:Num_iter
        B = Alpha * W / Mu;
        
        %% Updating T
        T_numerator = T_num(Initial_map, G, Z, Mu);
        T_denominator = T_denom(M, N, Mu);
        T_F = T_numerator./T_denominator;
        T = ifft2(ifftshift(T_F));
        
        gradient_T = multiplyd(T);

        %% Updating G using shrinkage operator
        G = sign(gradient_T +  Z / Mu) .* max(abs(gradient_T +  Z / Mu)- B, zeros(size(B)));
        
        %% Updating Z
        Z = Z + Mu * (gradient_T - G); %Z and mu sub-problem
        
        %% Updating Mu
        Mu = Mu * Rho;
        
    end
    
    Refined_map = T;    
    
end
%%