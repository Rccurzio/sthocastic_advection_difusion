function data = mesh_points(dimension_number_of_points)
    d = inputs;

    [delta_x, peclet] = spacial_step('x', dimension_number_of_points);
    [delta_y, ~]      = spacial_step('y', dimension_number_of_points);
    [delta_t, t_number_of_points] = temporal_step(delta_x);

    data.peclet  = peclet; 
    data.fourier = d.courant/peclet;

    x_grid = 0:delta_x:d.total_distance;
    y_grid = 0:delta_y:d.total_distance;
    [X, Y] = meshgrid(x_grid, y_grid);

    data.delta_x = delta_x;
    data.delta_y = delta_y;
    data.delta_t = delta_t;

    data.x_number_of_points = floor(dimension_number_of_points);
    data.y_number_of_points = floor(dimension_number_of_points);
    data.t_number_of_points = floor(t_number_of_points);

    data.x_grid = X;
    data.y_grid = Y;
end