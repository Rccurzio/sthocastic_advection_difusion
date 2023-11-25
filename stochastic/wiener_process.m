function non_random_noise = wiener_process(dimension, mesh_properties)
    d = inputs;
    mp = mesh_properties;
    
    if dimension == 'x'
        delta_s = mp.delta_x;
    elseif dimension == 'y'
        delta_s = mp.delta_y;
    else 
        error 'Dimensão não reconhecida'
    end 
    
    non_random_noise = sqrt(mp.delta_t/delta_s);
    non_random_noise = d.stochastic_relevance*non_random_noise;
end