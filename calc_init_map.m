function Initial_map = calc_init_map(img)
    
    [M, N, ~] = size(img);
    Initial_map = zeros(M,N);

    for i = 1:M
        for j = 1:N
            % find the channel with highest intensity
            Initial_map(i,j) = max([img(i,j,1), img(i,j,2), img(i,j,3)]);
            
            if Initial_map(i,j) == 0
                Initial_map(i,j) = 1e-7;
            end
        end
    end
    
end