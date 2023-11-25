function [step_size, peclet] = spacial_step(dimension, dimension_number_of_points)
    d = inputs;

    step_size = d.total_distance/(dimension_number_of_points - 1);
    
    if dimension == 'x'
        wind_velocity = d.permanent_wind_velocity_x;
    elseif dimension == 'y'
        wind_velocity = d.permanent_wind_velocity_y;
    else 
        error 'Dimensão não reconhecida'
    end 
    
    peclet = step_size*wind_velocity/d.diffusion_coef;
end