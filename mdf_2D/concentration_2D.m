function [concentration_per_volume, effective_dose, mp] = concentration_2D(data_inputs, dimension_number_of_points)
    
    d = data_inputs;
    mp = mesh_points(dimension_number_of_points);
    
    [mp.x_number_of_points, mp.y_number_of_points, mp.t_number_of_points]
    
    concentration_per_volume = zeros(mp.x_number_of_points, mp.y_number_of_points, mp.t_number_of_points);
    effective_dose           = zeros(mp.x_number_of_points, mp.y_number_of_points, mp.t_number_of_points);

    concentration_per_volume(d.source_x, d.source_y, :) = d.C_x1;
    
    [concentration_per_volume, effective_dose] = mdf_explicit_2D(concentration_per_volume, effective_dose, mp, d.is_stochastic);
end